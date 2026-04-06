import { useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useForm, useFieldArray, Controller } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import {
  Box,
  Button,
  Card,
  CardContent,
  Grid,
  IconButton,
  MenuItem,
  TextField,
  Typography,
  Alert,
  Divider,
} from '@mui/material';
import AddCircleOutlineIcon from '@mui/icons-material/AddCircleOutline';
import RemoveCircleOutlineIcon from '@mui/icons-material/RemoveCircleOutline';
import SaveIcon from '@mui/icons-material/Save';
import CancelIcon from '@mui/icons-material/Cancel';
import {
  useGetComputerQuery,
  useCreateComputerMutation,
  useUpdateComputerMutation,
  useGetProcessorsQuery,
  useGetGpusQuery,
} from '../api/computersApi';
import LoadingSpinner from '@/features/shared/components/LoadingSpinner';

const storageDriveSchema = z.object({
  capacityGB: z.coerce.number().min(1, 'Capacity must be at least 1 GB'),
  type: z.string().min(1, 'Type is required'),
});

const usbPortSchema = z.object({
  count: z.coerce.number().min(1, 'Count must be at least 1'),
  usbType: z.string().min(1, 'USB type is required'),
});

const computerSchema = z.object({
  name: z.string().min(1, 'Name is required').max(200, 'Name too long'),
  ramAmountMB: z.coerce.number().min(256, 'RAM must be at least 256 MB'),
  price: z.coerce.number().min(0.01, 'Price must be greater than 0'),
  imageUrl: z.string().url('Must be a valid URL').nullable().or(z.literal('')),
  weight: z.coerce.number().min(0.1, 'Weight must be greater than 0'),
  weightUnit: z.enum(['Kg', 'Lb']),
  psuWattage: z.coerce.number().min(1, 'PSU wattage must be at least 1W'),
  processorId: z.coerce.number().min(1, 'Processor is required'),
  gpuId: z.coerce.number().min(1, 'GPU is required'),
  storageDrives: z.array(storageDriveSchema).min(1, { message: 'At least one storage drive is required' }),
  usbPorts: z.array(usbPortSchema).min(0),
});

type FormValues = z.infer<typeof computerSchema>;

const STORAGE_TYPES = ['SSD', 'HDD'];
const USB_TYPES = ['USB 2.0', 'USB 3.0', 'USB-C'];

const RAM_OPTIONS = [
  { value: 2048, label: '2 GB (2048 MB)' },
  { value: 4096, label: '4 GB (4096 MB)' },
  { value: 8192, label: '8 GB (8192 MB)' },
  { value: 16384, label: '16 GB (16384 MB)' },
  { value: 32768, label: '32 GB (32768 MB)' },
  { value: 65536, label: '64 GB (65536 MB)' },
  { value: 131072, label: '128 GB (131072 MB)' },
];

const STORAGE_CAPACITY_OPTIONS = [
  { value: 128, label: '128 GB' },
  { value: 256, label: '256 GB' },
  { value: 500, label: '500 GB' },
  { value: 512, label: '512 GB' },
  { value: 1000, label: '1 TB (1000 GB)' },
  { value: 2000, label: '2 TB (2000 GB)' },
  { value: 4000, label: '4 TB (4000 GB)' },
  { value: 8000, label: '8 TB (8000 GB)' },
];

export default function ComputerForm(): JSX.Element {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const isEditing = Boolean(id);

  const { data: computer, isLoading: isLoadingComputer } = useGetComputerQuery(
    Number(id),
    { skip: !isEditing },
  );
  const { data: processors = [] } = useGetProcessorsQuery();
  const { data: gpus = [] } = useGetGpusQuery();
  const [createComputer, { isLoading: isCreating, error: createError }] =
    useCreateComputerMutation();
  const [updateComputer, { isLoading: isUpdating, error: updateError }] =
    useUpdateComputerMutation();

  const {
    control,
    handleSubmit,
    reset,
    watch,
    formState: { errors },
  } = useForm<FormValues>({
    resolver: zodResolver(computerSchema),
    defaultValues: {
      name: '',
      ramAmountMB: 8192,
      price: 0,
      imageUrl: '',
      weight: 0,
      weightUnit: 'Kg',
      psuWattage: 500,
      processorId: 0,
      gpuId: 0,
      storageDrives: [],
      usbPorts: [],
    },
  });

  const {
    fields: driveFields,
    append: appendDrive,
    remove: removeDrive,
  } = useFieldArray({ control, name: 'storageDrives' });

  const {
    fields: usbFields,
    append: appendUsb,
    remove: removeUsb,
  } = useFieldArray({ control, name: 'usbPorts' });

  const imageUrl = watch('imageUrl');

  useEffect(() => {
    if (computer && isEditing) {
      reset({
        name: computer.name,
        ramAmountMB: computer.ramAmountMB,
        price: computer.price,
        imageUrl: computer.imageUrl || '',
        weight: computer.weight,
        weightUnit: computer.weightUnit,
        psuWattage: computer.psuWattage,
        processorId: computer.processorId,
        gpuId: computer.gpuId,
        storageDrives: computer.storageDrives.map((d) => ({
          capacityGB: d.capacityGB,
          type: d.type,
        })),
        usbPorts: computer.usbPorts.map((p) => ({
          count: p.count,
          usbType: p.usbType,
        })),
      });
    }
  }, [computer, isEditing, reset]);

  const onSubmit = async (data: FormValues): Promise<void> => {
    const selectedProcessor = processors.find((p) => p.id === data.processorId);
    const selectedGpu = gpus.find((g) => g.id === data.gpuId);

    if (!selectedProcessor || !selectedGpu) return;

    const { processorId: _pId, gpuId: _gId, ...rest }: FormValues = data;
    const payload = {
      ...rest,
      imageUrl: data.imageUrl || null,
      processorName: selectedProcessor.name,
      processorBrand: selectedProcessor.brand,
      gpuName: selectedGpu.name,
      gpuBrand: selectedGpu.brand,
    };

    try {
      if (isEditing) {
        await updateComputer({ id: Number(id), data: payload }).unwrap();
        navigate(`/computers/${id}`);
      } else {
        const created = await createComputer(payload).unwrap();
        navigate(`/computers/${created.id}`);
      }
    } catch {
      // Error is captured by RTK Query state
    }
  };

  if (isEditing && isLoadingComputer) return <LoadingSpinner />;

  const mutationError = createError || updateError;
  const errorMessage =
    mutationError && 'data' in mutationError
      ? String(mutationError.data)
      : mutationError
        ? 'An error occurred'
        : null;

  return (
    <Box component="form" onSubmit={handleSubmit(onSubmit)} noValidate>
      <Typography variant="h4" component="h1" sx={{ mb: 3 }}>
        {isEditing ? 'Edit Computer' : 'Add New Computer to the Royal Catalog'}
      </Typography>

      {errorMessage && (
        <Alert severity="error" sx={{ mb: 2 }}>
          {errorMessage}
        </Alert>
      )}

      <Grid container spacing={3}>
        {/* Basic Info */}
        <Grid item xs={12} md={8}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Basic Information
              </Typography>
              <Grid container spacing={2}>
                <Grid item xs={12}>
                  <Controller
                    name="name"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="Name"
                        fullWidth
                        error={!!errors.name}
                        helperText={errors.name?.message}
                      />
                    )}
                  />
                </Grid>
                <Grid item xs={6}>
                  <Controller
                    name="ramAmountMB"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="RAM"
                        select
                        fullWidth
                        error={!!errors.ramAmountMB}
                        helperText={errors.ramAmountMB?.message}
                      >
                        {RAM_OPTIONS.map((opt) => (
                          <MenuItem key={opt.value} value={opt.value}>
                            {opt.label}
                          </MenuItem>
                        ))}
                      </TextField>
                    )}
                  />
                </Grid>
                <Grid item xs={6}>
                  <Controller
                    name="price"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="Price ($)"
                        type="number"
                        fullWidth
                        error={!!errors.price}
                        helperText={errors.price?.message}
                        inputProps={{ step: '0.01' }}
                      />
                    )}
                  />
                </Grid>
                <Grid item xs={12}>
                  <Controller
                    name="imageUrl"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="Image URL"
                        fullWidth
                        error={!!errors.imageUrl}
                        helperText={errors.imageUrl?.message}
                      />
                    )}
                  />
                </Grid>
                <Grid item xs={6}>
                  <Controller
                    name="weight"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="Weight"
                        type="number"
                        fullWidth
                        error={!!errors.weight}
                        helperText={errors.weight?.message}
                        inputProps={{ step: '0.1' }}
                      />
                    )}
                  />
                </Grid>
                <Grid item xs={6}>
                  <Controller
                    name="weightUnit"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="Weight Unit"
                        select
                        fullWidth
                        error={!!errors.weightUnit}
                        helperText={errors.weightUnit?.message}
                      >
                        <MenuItem value="Kg">Kilograms (Kg)</MenuItem>
                        <MenuItem value="Lb">Pounds (Lb)</MenuItem>
                      </TextField>
                    )}
                  />
                </Grid>
                <Grid item xs={6}>
                  <Controller
                    name="psuWattage"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="PSU Wattage"
                        type="number"
                        fullWidth
                        error={!!errors.psuWattage}
                        helperText={errors.psuWattage?.message}
                      />
                    )}
                  />
                </Grid>
                <Grid item xs={6}>
                  <Controller
                    name="processorId"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="Processor"
                        select
                        fullWidth
                        error={!!errors.processorId}
                        helperText={errors.processorId?.message}
                      >
                        <MenuItem value={0} disabled>
                          Select a processor
                        </MenuItem>
                        {processors.map((p) => (
                          <MenuItem key={p.id} value={p.id}>
                            {p.brand} {p.name}
                          </MenuItem>
                        ))}
                      </TextField>
                    )}
                  />
                </Grid>
                <Grid item xs={6}>
                  <Controller
                    name="gpuId"
                    control={control}
                    render={({ field }) => (
                      <TextField
                        {...field}
                        label="GPU"
                        select
                        fullWidth
                        error={!!errors.gpuId}
                        helperText={errors.gpuId?.message}
                      >
                        <MenuItem value={0} disabled>
                          Select a GPU
                        </MenuItem>
                        {gpus.map((g) => (
                          <MenuItem key={g.id} value={g.id}>
                            {g.brand} {g.name}
                          </MenuItem>
                        ))}
                      </TextField>
                    )}
                  />
                </Grid>
              </Grid>
            </CardContent>
          </Card>
        </Grid>

        {/* Image Preview */}
        <Grid item xs={12} md={4}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Image Preview
              </Typography>
              <Box
                component="img"
                src={
                  imageUrl ||
                  'https://placehold.co/400x300/2D1B4E/D4AF37?text=%F0%9F%91%91'
                }
                alt="Preview"
                sx={{
                  width: '100%',
                  borderRadius: 2,
                  border: '1px solid',
                  borderColor: 'secondary.main',
                  objectFit: 'cover',
                  maxHeight: 250,
                }}
                onError={(e: React.SyntheticEvent<HTMLImageElement>) => {
                  e.currentTarget.src =
                    'https://placehold.co/400x300/2D1B4E/D4AF37?text=%F0%9F%91%91';
                }}
              />
            </CardContent>
          </Card>
        </Grid>

        {/* Storage Drives */}
        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Box
                sx={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  mb: 1,
                }}
              >
                <Typography variant="h6">Storage Drives</Typography>
                <IconButton
                  color="secondary"
                  onClick={() => appendDrive({ capacityGB: 512, type: 'SSD' })}
                >
                  <AddCircleOutlineIcon />
                </IconButton>
              </Box>
              <Divider sx={{ mb: 2 }} />
              {driveFields.map((field, index) => (
                <Box
                  key={field.id}
                  sx={{ display: 'flex', gap: 1, mb: 1.5, alignItems: 'flex-start' }}
                >
                  <Controller
                    name={`storageDrives.${index}.capacityGB`}
                    control={control}
                    render={({ field: f }) => (
                      <TextField
                        {...f}
                        label="Capacity"
                        select
                        size="small"
                        sx={{ flex: 1 }}
                        error={!!errors.storageDrives?.[index]?.capacityGB}
                      >
                        {STORAGE_CAPACITY_OPTIONS.map((opt) => (
                          <MenuItem key={opt.value} value={opt.value}>
                            {opt.label}
                          </MenuItem>
                        ))}
                      </TextField>
                    )}
                  />
                  <Controller
                    name={`storageDrives.${index}.type`}
                    control={control}
                    render={({ field: f }) => (
                      <TextField
                        {...f}
                        label="Type"
                        select
                        size="small"
                        sx={{ flex: 1 }}
                        error={!!errors.storageDrives?.[index]?.type}
                      >
                        {STORAGE_TYPES.map((t) => (
                          <MenuItem key={t} value={t}>
                            {t}
                          </MenuItem>
                        ))}
                      </TextField>
                    )}
                  />
                  <IconButton
                    color="error"
                    onClick={() => removeDrive(index)}
                    size="small"
                  >
                    <RemoveCircleOutlineIcon />
                  </IconButton>
                </Box>
              ))}
              {driveFields.length === 0 && (
                <Typography variant="body2" color="text.secondary">
                  No storage drives added yet.
                </Typography>
              )}
            </CardContent>
          </Card>
        </Grid>

        {/* USB Ports */}
        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Box
                sx={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  mb: 1,
                }}
              >
                <Typography variant="h6">USB Ports</Typography>
                <IconButton
                  color="secondary"
                  onClick={() => appendUsb({ count: 1, usbType: 'USB 3.0' })}
                >
                  <AddCircleOutlineIcon />
                </IconButton>
              </Box>
              <Divider sx={{ mb: 2 }} />
              {usbFields.map((field, index) => (
                <Box
                  key={field.id}
                  sx={{ display: 'flex', gap: 1, mb: 1.5, alignItems: 'flex-start' }}
                >
                  <Controller
                    name={`usbPorts.${index}.count`}
                    control={control}
                    render={({ field: f }) => (
                      <TextField
                        {...f}
                        label="Count"
                        type="number"
                        size="small"
                        sx={{ flex: 0.5 }}
                        error={!!errors.usbPorts?.[index]?.count}
                      />
                    )}
                  />
                  <Controller
                    name={`usbPorts.${index}.usbType`}
                    control={control}
                    render={({ field: f }) => (
                      <TextField
                        {...f}
                        label="USB Type"
                        select
                        size="small"
                        sx={{ flex: 1 }}
                        error={!!errors.usbPorts?.[index]?.usbType}
                      >
                        {USB_TYPES.map((t) => (
                          <MenuItem key={t} value={t}>
                            {t}
                          </MenuItem>
                        ))}
                      </TextField>
                    )}
                  />
                  <IconButton
                    color="error"
                    onClick={() => removeUsb(index)}
                    size="small"
                  >
                    <RemoveCircleOutlineIcon />
                  </IconButton>
                </Box>
              ))}
              {usbFields.length === 0 && (
                <Typography variant="body2" color="text.secondary">
                  No USB ports added yet.
                </Typography>
              )}
            </CardContent>
          </Card>
        </Grid>
      </Grid>

      {/* Actions */}
      <Box sx={{ display: 'flex', gap: 2, mt: 3, justifyContent: 'flex-end' }}>
        <Button
          variant="outlined"
          startIcon={<CancelIcon />}
          onClick={() => navigate(isEditing ? `/computers/${id}` : '/')}
        >
          Cancel
        </Button>
        <Button
          type="submit"
          variant="contained"
          startIcon={<SaveIcon />}
          disabled={isCreating || isUpdating}
        >
          {isCreating || isUpdating
            ? 'Saving...'
            : isEditing
              ? 'Update Computer'
              : 'Add to Catalog'}
        </Button>
      </Box>
    </Box>
  );
}
