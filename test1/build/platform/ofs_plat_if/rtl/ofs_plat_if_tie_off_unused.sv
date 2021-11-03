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

//
// Tie off unused ports in the ofs_plat_if interface.
//

module ofs_plat_if_tie_off_unused
  #(
    // Masks are bit masks, with bit 0 corresponding to port/bank zero.
    // Set a bit in the mask when a port is IN USE by the design.
    // This way, the AFU does not need to know about every available
    // device. By default, devices are tied off.
    parameter bit [31:0] HOST_CHAN_IN_USE_MASK = 0,
    parameter bit [31:0] LOCAL_MEM_IN_USE_MASK = 0,
    parameter bit [31:0] HSSI_IN_USE_MASK = 0,

    // Emit debugging messages in simulation for tie-offs?
    parameter QUIET = 0
    )
   (
    ofs_plat_if plat_ifc
    );

    genvar i;

    generate
        for (i = 0; i < plat_ifc.host_chan.NUM_PORTS; i = i + 1)
        begin : tie_host_chan
            if (~HOST_CHAN_IN_USE_MASK[i])
            begin : m
                ofs_plat_host_chan_fiu_if_tie_off tie_off(plat_ifc.host_chan.ports[i]);

                // synthesis translate_off
                initial
                begin
                    if (QUIET == 0) $display("%m: Tied off plat_ifc.host_chan.ports[%0d]", i);
                end
                // synthesis translate_on
            end
        end
    endgenerate

    generate
        for (i = 0; i < plat_ifc.local_mem.NUM_BANKS; i = i + 1)
        begin : tie_local_mem
            if (~LOCAL_MEM_IN_USE_MASK[i])
            begin : m
                ofs_plat_local_mem_fiu_if_tie_off tie_off(plat_ifc.local_mem.banks[i]);

                // synthesis translate_off
                initial
                begin
                    if (QUIET == 0) $display("%m: Tied off plat_ifc.local_mem.banks[%0d]", i);
                end
                // synthesis translate_on
            end
        end
    endgenerate

    generate
        for (i = 0; i < plat_ifc.hssi.NUM_PORTS; i = i + 1)
        begin : tie_hssi
            if (~HSSI_IN_USE_MASK[i])
            begin : m
                ofs_plat_hssi_fiu_if_tie_off tie_off(plat_ifc.hssi.ports[i]);

                // synthesis translate_off
                initial
                begin
                    if (QUIET == 0) $display("%m: Tied off plat_ifc.hssi.ports[%0d]", i);
                end
                // synthesis translate_on
            end
        end
    endgenerate

endmodule // ofs_plat_if_tie_off_unused
