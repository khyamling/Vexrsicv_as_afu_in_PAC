//
// Copyright (c) 2018, Intel Corporation
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

`ifndef __OFS_PLAT_IF_TOP_CONFIG_VH__
`define __OFS_PLAT_IF_TOP_CONFIG_VH__

//
// This is the primary parameterization of the platform.
//
// Preprocessor parameters allow AFUs to configure their connections
// based on platform-specific details. Some of the parameters must be
// defined in order for the platform definition to conform to the OFS
// top-level interface standard.
//


// ========================================================================
//
//  define interface parameters
//
// ========================================================================

`define PLATFORM_FPGA_FAMILY_A10 1
`define PLATFORM_FPGA_FAMILY_A10_GX 1
`define PLATFORM_FPGA_PAC 1
`define PLATFORM_FPGA_PAC_RC 1


// ========================================================================
//
//  clocks interface parameters
//
// ========================================================================

`define OFS_PLAT_PARAM_CLOCKS_PCLK_FREQ 200


// ========================================================================
//
//  host_chan (native_ccip) interface parameters
//
// ========================================================================

`define OFS_PLAT_PARAM_HOST_CHAN_IS_NATIVE_CCIP 1
`define OFS_PLAT_PARAM_HOST_CHAN_NUM_PORTS 1
`define OFS_PLAT_PARAM_HOST_CHAN_ADDR_WIDTH 42
`define OFS_PLAT_PARAM_HOST_CHAN_DATA_WIDTH 512
`define OFS_PLAT_PARAM_HOST_CHAN_MMIO_ADDR_WIDTH 18
`define OFS_PLAT_PARAM_HOST_CHAN_BYTE_EN_SUPPORTED 0
`define OFS_PLAT_PARAM_HOST_CHAN_ADDRESS_SPACE "IOADDR"
`define OFS_PLAT_PARAM_HOST_CHAN_C0_SUPPORTED_REQS (C0_REQ_RDLINE_S | C0_REQ_RDLINE_I)
`define OFS_PLAT_PARAM_HOST_CHAN_C1_SUPPORTED_REQS (C1_REQ_WRLINE_S | C1_REQ_WRLINE_I | C1_REQ_WRFENCE | C1_REQ_INTR)
`define OFS_PLAT_PARAM_HOST_CHAN_VC_SUPPORTED { 1, 0, 1, 0 }
`define OFS_PLAT_PARAM_HOST_CHAN_VC_DEFAULT 2
`define OFS_PLAT_PARAM_HOST_CHAN_NUM_PHYS_CHANNELS 1
`define OFS_PLAT_PARAM_HOST_CHAN_CL_LEN_SUPPORTED { 1, 1, 0, 1 }
`define OFS_PLAT_PARAM_HOST_CHAN_MAX_BW_ACTIVE_LINES_C0 { 256, 256, 256, 256 }
`define OFS_PLAT_PARAM_HOST_CHAN_MAX_BW_ACTIVE_LINES_C1 { 128, 128, 128, 128 }
`define OFS_PLAT_PARAM_HOST_CHAN_MAX_OUTSTANDING_MMIO_RD_REQS 64
`define OFS_PLAT_PARAM_HOST_CHAN_SUGGESTED_TIMING_REG_STAGES 1
`define OFS_PLAT_PARAM_HOST_CHAN_NATIVE_CLASS "native_ccip"


// ========================================================================
//
//  local_mem (native_avalon) interface parameters
//
// ========================================================================

`define OFS_PLAT_PARAM_LOCAL_MEM_IS_NATIVE_AVALON 1
`define OFS_PLAT_PARAM_LOCAL_MEM_NUM_BANKS 2
`define OFS_PLAT_PARAM_LOCAL_MEM_ADDR_WIDTH 26
`define OFS_PLAT_PARAM_LOCAL_MEM_DATA_WIDTH 512
`define OFS_PLAT_PARAM_LOCAL_MEM_BURST_CNT_WIDTH 7
`define OFS_PLAT_PARAM_LOCAL_MEM_ECC_WIDTH 0
`define OFS_PLAT_PARAM_LOCAL_MEM_MASKED_FULL_SYMBOL_WIDTH 8
`define OFS_PLAT_PARAM_LOCAL_MEM_MAX_BW_ACTIVE_LINES_RD 256
`define OFS_PLAT_PARAM_LOCAL_MEM_MAX_BW_ACTIVE_LINES_WR 128
`define OFS_PLAT_PARAM_LOCAL_MEM_SUGGESTED_TIMING_REG_STAGES 0
`define OFS_PLAT_PARAM_LOCAL_MEM_USER_WIDTH 1
`define OFS_PLAT_PARAM_LOCAL_MEM_NATIVE_CLASS "native_avalon"


// ========================================================================
//
//  hssi (raw_pr) interface parameters
//
// ========================================================================

`define OFS_PLAT_PARAM_HSSI_IS_RAW_PR 1
`define OFS_PLAT_PARAM_HSSI_BANDWIDTH_OFFERED ( HSSI_BW_4x10G | HSSI_BW_40G )
`define OFS_PLAT_PARAM_HSSI_NUM_PORTS 1
`define OFS_PLAT_PARAM_HSSI_RAW_NUM_LANES 4
`define OFS_PLAT_PARAM_HSSI_RAW_LANE_WIDTH 128
`define OFS_PLAT_PARAM_HSSI_NATIVE_CLASS "raw_pr"


// ========================================================================
//
//  Compatibility
//
// ========================================================================

`include "platform_afu_top_config.vh"

//
// Define preprocessor parameters expected by older code.
//

// Is local memory available? (Required by PIM v1 AFUs.)
`ifdef OFS_PLAT_PARAM_LOCAL_MEM_NUM_BANKS
  `ifdef AFU_TOP_REQUIRES_LOCAL_MEMORY_AVALON_MM
    `define PLATFORM_PROVIDES_LOCAL_MEMORY 1
  `elsif AFU_TOP_REQUIRES_LOCAL_MEMORY_AVALON_MM_LEGACY_WIRES_2BANK
    `define PLATFORM_PROVIDES_LOCAL_MEMORY 1
  `endif
`endif


// ========================================================================
//
//  ASE
//
// ========================================================================

// When OFS_PLAT_PROVIDES_ASE_TOP, the OFS platform provides an ASE top-level
// module that generates ofs_plat_if. With this mechanism, the platform can
// construct a platform-specific simulated top-level environment.
// The macro specifies the module name that ASE's root module should
// instantiate.
`define OFS_PLAT_PROVIDES_ASE_TOP ase_top_ofs_plat

`endif // __OFS_PLAT_IF_TOP_CONFIG_VH__
