using AutoMapper;
using CompuPalace.Application.DTOs;
using CompuPalace.Application.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace CompuPalace.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class GpusController : ControllerBase
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public GpusController(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    [HttpGet]
    public async Task<ActionResult<List<GpuDto>>> GetAll(CancellationToken cancellationToken = default)
    {
        var gpus = await _unitOfWork.Gpus.GetAllAsync(cancellationToken);
        var dtos = _mapper.Map<List<GpuDto>>(gpus);
        return Ok(dtos);
    }
}
