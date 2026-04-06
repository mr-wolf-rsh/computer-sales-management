using CompuPalace.Application.DTOs;
using CompuPalace.Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace CompuPalace.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ComputersController : ControllerBase
{
    private readonly IComputerService _computerService;

    public ComputersController(IComputerService computerService)
    {
        _computerService = computerService;
    }

    [HttpGet]
    public async Task<ActionResult<PaginatedResult<ComputerDto>>> GetPaged(
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 10,
        CancellationToken cancellationToken = default)
    {
        var result = await _computerService.GetPagedAsync(page, pageSize, cancellationToken);
        return Ok(result);
    }

    [HttpGet("{id:int}")]
    public async Task<ActionResult<ComputerDto>> GetById(int id, CancellationToken cancellationToken = default)
    {
        var computer = await _computerService.GetByIdAsync(id, cancellationToken);
        if (computer is null)
            return NotFound();

        return Ok(computer);
    }

    [HttpGet("search")]
    public async Task<ActionResult<PaginatedResult<ComputerDto>>> Search(
        [FromQuery] string q = "",
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 10,
        CancellationToken cancellationToken = default)
    {
        var result = await _computerService.SearchAsync(q, page, pageSize, cancellationToken);
        return Ok(result);
    }

    [HttpPost]
    public async Task<ActionResult<ComputerDto>> Create(
        [FromBody] ComputerCreateDto dto,
        CancellationToken cancellationToken = default)
    {
        var created = await _computerService.CreateAsync(dto, cancellationToken);
        return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
    }

    [HttpPut("{id:int}")]
    public async Task<ActionResult<ComputerDto>> Update(
        int id,
        [FromBody] ComputerUpdateDto dto,
        CancellationToken cancellationToken = default)
    {
        var updated = await _computerService.UpdateAsync(id, dto, cancellationToken);
        if (updated is null)
            return NotFound();

        return Ok(updated);
    }

    [HttpDelete("{id:int}")]
    public async Task<IActionResult> Delete(int id, CancellationToken cancellationToken = default)
    {
        var deleted = await _computerService.DeleteAsync(id, cancellationToken);
        if (!deleted)
            return NotFound();

        return NoContent();
    }

    [HttpGet("dashboard")]
    public async Task<ActionResult<DashboardStatsDto>> GetDashboardStats(CancellationToken cancellationToken = default)
    {
        var stats = await _computerService.GetDashboardStatsAsync(cancellationToken);
        return Ok(stats);
    }
}
