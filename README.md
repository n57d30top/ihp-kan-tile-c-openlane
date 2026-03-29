# 1-Bit Kolmogorov-Arnold Network (KAN) NPU Logic Block (IHP SG13G2)

This repository contains the physical layout and RTL implementation of a hardware-synthesized **1-bit Kolmogorov-Arnold Network (KAN)** macro block, specifically engineered for the **IHP SG13G2 (130nm BiCMOS)** open-source semiconductor node.

## Architecture

Traditional State Space Models (Mamba) and LLMs rely on massive, monolithic SRAM footprints and complex `FP16/INT8` multipliers. This architecture completely abandons classical Von-Neumann memory bottlenecks.

We mathematically discretized the complex 1D B-splines of continuous Kolmogorov-Arnold Networks into deterministic, highly rigid **Look-Up Table (LUT)** hardware profiles natively targeting the primary `Tile C (SFU)` computational macro of the Sovryn array.

*   **Silicon Node:** IHP SG13G2 (130nm BiCMOS, Germany)
*   **Macro Topology:** Native `tile_c_sfu` (1D `int16` PWL Look-Up-Table network)
*   **Fabrication Limit:** Engineered strictly for `< 2.0 mm²` die footprints to perfectly comply with the European IHP OpenMPW grant quotas.
*   **Power Envelope:** Estimated at `< 20 mW` dynamic power draw at 100MHz clock.

## OpenLane Physical Verification

The associated RTL logic (`sovryn_pan_stem_npu_tile_c_kan_lut_eval_v1.v`) has been successfully synthesized and routed through the complete automated OpenLane physical design flow.

*   **DRC Check:** Passed
*   **LVS Check:** Passed
*   **Antenna Violations:** Passed
*   **Routing / Timing Flow Errors:** 0

## Intellectual Property & Immutable Prior Art

To establish an indisputable, immutable mathematical proof of prior art and architectural authorship before engaging with open-source MPW shuttles, the exact SHA-256 state-hashes of this repository and the physical semiconductor masks have been permanently anchored to the Ethereum Base L2 blockchain.

### 1. Conceptual Architecture Anchor
* **Network:** Base L2 Mainnet
* **Anchor Timestamp:** March 29, 2026
* **SHA-256 IP Hash:** `964dbc533cdb069546995dbed972849ab164304d984bcbfcfe4cc361856a57f2`
* **Transaction Validation:** `[0xe4d8ab84d7604f33b3443943910c53e99b082b5196c40ee94bbe8c5fbd4f13c8](https://basescan.org/tx/0xe4d8ab84d7604f33b3443943910c53e99b082b5196c40ee94bbe8c5fbd4f13c8)`

### 2. Physical Silicon Mask Anchor
The following hardware layout components have been securely hashed and burned into Block **43998560** directly as raw transaction data payload.
*   **GDS SHA256:** `5FB3E144C8343CEDD27F2D93A809A236E2825CD584FEBAAF21DAE92B382E897C`
*   **Top-level wrapper SHA256:** `DF199B868E00DCDC61F153F0F0DEEAED7A02907B7BAE846F7C75FD3E5BC7793E`
*   **Tile C LUT module SHA256:** `CDF2042B5652B7C87FBFF83AAC5B29F3A7F195C0F076E468C250DCA16F6721B8`
* **Transaction Validation:** `[0x9ef8af41caf92bd23423cc9de301b74efaa5855440e28e6d30f5f390d7d607d7](https://basescan.org/tx/0x9ef8af41caf92bd23423cc9de301b74efaa5855440e28e6d30f5f390d7d607d7)`

## License
Released under the Apache 2.0 License.
