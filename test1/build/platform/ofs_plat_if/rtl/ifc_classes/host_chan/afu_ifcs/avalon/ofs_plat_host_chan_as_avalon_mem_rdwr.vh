//
// Copyright (c) 2019, Intel Corporation
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
//
// Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation
// and/or other materials provided with the distribution.
//
// Neither the name of the Intel Corporation nor the names of its contributors
// may be used to endorse or promote products derived from this software
// without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

`ifndef __OFS_PLAT_HOST_CHAN_AS_AVALON_MEM_RDWR__
`define __OFS_PLAT_HOST_CHAN_AS_AVALON_MEM_RDWR__

//
// Macros for setting parameters to Avalon split-bus read/write interfaces.
//

// Avalon host memory ofs_plat_avalon_mem_rdwr_if parameters.
// AFUs may set BURST_CNT_WIDTH to whatever works in the AFU. The PIM will
// transform bursts into legal native host channel requests.
`define HOST_CHAN_AVALON_MEM_RDWR_PARAMS \
    .ADDR_WIDTH(ofs_plat_host_chan_pkg::ADDR_WIDTH_LINES), \
    .DATA_WIDTH(ofs_plat_host_chan_pkg::DATA_WIDTH)

// Avalon MMIO ofs_plat_avalon_mem_if parameters. For Avalon MMIO
// we encode the address as the index of BUSWIDTH-sized words in the
// MMIO space. For example, for 64 bit BUSWIDTH address 1 is the second
// 64 bit word in MMIO space. Smaller requests in the MMIO space use
// byteenable.
`define HOST_CHAN_AVALON_MMIO_PARAMS(BUSWIDTH) \
    .ADDR_WIDTH(ofs_plat_host_chan_pkg::MMIO_ADDR_WIDTH_BYTES - $clog2(BUSWIDTH/8)), \
    .DATA_WIDTH(BUSWIDTH), \
    .BURST_CNT_WIDTH(1)


`endif // __OFS_PLAT_HOST_CHAN_AS_AVALON_MEM_RDWR__
