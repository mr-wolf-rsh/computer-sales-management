using AutoMapper;
using CompuPalace.Application.DTOs;
using CompuPalace.Application.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace CompuPalace.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProcessorsController : ControllerBase
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public ProcessorsController(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    [HttpGet]
    public async Task<ActionResult<List<ProcessorDto>>> GetAll(CancellationToken cancellationToken = default)
    {
        var processors = await _unitOfWork.Processors.GetAllAsync(cancellationToken);
        var dtos = _mapper.Map<List<ProcessorDto>>(processors);
        return Ok(dtos);
    }
}
