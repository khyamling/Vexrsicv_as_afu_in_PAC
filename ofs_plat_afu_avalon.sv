
//
// Copyright (c) 2020, Intel Corporation
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

`include "ofs_plat_if.vh"
`include "afu_json_info.vh"

//
// Avalon-MM version of hello world AFU example.
//

module ofs_plat_afu
   (
    // All platform wires, wrapped in one interface.
    ofs_plat_if plat_ifc
    );

    // ====================================================================
    //
    //  Get an Avalon-MM host channel connection from the platform.
    //
    // ====================================================================

    // Instance of the PIM's standard Avalon memory interface. The DMA
    // interface exposed by the PIM splits the read and write buses into
    // separate channels. This split bus matches the topologies of the
    // equivalent AXI-MM and CCI-P interfaces. It also offers greater
    // throughput than a shared read/write bus.
    ofs_plat_avalon_mem_rdwr_if
      #(
        // The PIM provides parameters for configuring a standard host
        // memory DMA Avalon memory interface.
        `HOST_CHAN_AVALON_MEM_RDWR_PARAMS,
        // PIM interfaces can be configured to log traffic during
        // simulation. In ASE, see work/log_ofs_plat_host_chan.tsv.
        .LOG_CLASS(ofs_plat_log_pkg::HOST_CHAN)
        )
      host_mem();

    // Instance of the PIM's Avalon interface, which will be used to
    // implement the AFU's CSR space.
    ofs_plat_avalon_mem_if
      #(
        // The AFU choses the data bus width of the interface and the
        // PIM adjusts the address space to match.
        `HOST_CHAN_AVALON_MMIO_PARAMS(64),
        // Log MMIO traffic. (See the same parameter above on host_mem.)
        .LOG_CLASS(ofs_plat_log_pkg::HOST_CHAN)
        )
        mmio64_to_afu();

    // Use the platform-provided module to map the primary host interface
    // to Avalon-MM. The "primary" interface is the port that includes the
    // main OPAE-managed MMIO connection. This primary port is always
    // index 0 of plat_ifc.host_chan.ports, indepedent of the platform
    // and the native protocol of the host channel. This same module
    // name is available both on platforms that expose AXI-S PCIe TLP
    // streams to the AFU and on platforms that expose CCI-P.
    ofs_plat_host_chan_as_avalon_mem_rdwr_with_mmio primary_avalon
       (
        .to_fiu(plat_ifc.host_chan.ports[0]),
        .host_mem_to_afu(host_mem),
        .mmio_to_afu(mmio64_to_afu),

        // Use user clock
        .afu_clk(plat_ifc.clocks.uClk_usr.clk),
        .afu_reset_n(plat_ifc.clocks.uClk_usr.reset_n)
        );
        
        
  // ====================================================================
    //
    //  Pass the constructed interfaces to the AFU.
    //
    // ====================================================================

    afu afu
      (
       .mmio64_if(mmio64_to_afu)
       );

    // Tie off host memory -- not used by this test
    assign host_mem.rd_address = '0;
    assign host_mem.rd_read = '0;
    assign host_mem.rd_burstcount = '0;
    assign host_mem.rd_byteenable = '0;
    assign host_mem.rd_user = '0;
    assign host_mem.wr_address = '0;
    assign host_mem.wr_write = '0;
    assign host_mem.wr_burstcount = '0;
    assign host_mem.wr_writedata = '0;
    assign host_mem.wr_byteenable = '0;
    assign host_mem.wr_user = '0;

endmodule // ofs_plat_afu

