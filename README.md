## DeepCircuitX — Repository Navigation Guide

This repo mirrors/organizes artifacts from the DeepCircuitX dataset to make it easy to browse and use locally. DeepCircuitX aggregates chip/IP/module-level RTL and RISC‑V projects, plus natural‑language annotations and training/evaluation data for LLMs.

Reference: see the official dataset overview “Source RTL code” for scope, levels, and counts: [DeepCircuitX: Source RTL code](https://zeju.gitbook.io/lcm-team/deepcircuitx/souce-rtl-code).

### What’s inside (high‑level)
- **Source RTL code**: Verilog/SystemVerilog modules and projects organized by design level (Chip, IP, Module, RISC‑V).
- **Intermediate NL annotations**: Auto‑generated specs/Q&A/module blurbs derived from RTL for model training prep.
- **SFT training data samples**: JSON corpora for supervised fine‑tuning on tasks like code completion, generation and understanding. 
- **Evaluation prompts**: Prompt templates for evaluating comment generation, code generation, and completion.

### Directory layout
- `Hierarchy/`
  - `chip/`, `ip/`, `module/`, `riscv/`: Design artifacts grouped by level, mirroring DeepCircuitX’s taxonomy noted on the official page.
  - Within each design family you’ll find project subfolders; many modules include a sibling annotation folder named like `_<module_name>_/intermediate_comment/`.
  - Example (Module level):
    - `Hierarchy/module/4-Bit_Arithmetic_Logic_Unit/4-bit-16-function-complete-alu/_abc_/`
      - `intermediate_comment/`
        - `abc_spec.json` — one‑paragraph module spec + prompt scaffolding (includes embedded original RTL references)
        - `abc_QA.json` — focused Q&A about ports/signals/behavior
        - `abc_module.json` — concise module blurb
        - `*_blocks.json` — optional placeholder for future block‑level segmentation
      - `spec/spec.txt`, `abc.txt` — flattened summaries of the above
      - Original RTL lives alongside (e.g., `.v` files) in the module/project tree

- Training corpora (root):
  - `Training-CodeComp.json` — SFT pairs for code completion from description/ code
    - Schema per entry:
      - `instruction` — fixed task prompt (e.g., “Based on the module-level description, generate the corresponding Verilog code.”)
      - `input` — plain‑text “Module‑level description: …”
      - `output` — target Verilog code as a single string (module RTL)
  - `Training-CodeGen.json` — same schema but code generation tasks (same general schema: `instruction`/`input`/`output`)
  - `Training-CodeUnderstand.json` — same schema but code commenting / understanding tasks (if populated)

- Evaluation:
  - `eval_data/dataset_new_comment_generation_prompt.json`
  - `eval_data/dataset_new_code_generation_prompt.json`
  - `eval_data/dataset_new_code_completion_prompt.json`
  - These contain prompt templates for consistent offline evaluation of LLMs on comment gen, code gen, and completion.

### How to use the pieces
- **Authoritative RTL**: Always treat the `.v`/`.sv` files as ground truth for synthesis/simulation.
- **Intermediate annotations** (`intermediate_comment/`):
  - Use to build instruction‑tuning samples (specs, Q&A, short blurbs). These are staging artifacts, not meant for synthesis.
  - No chain‑of‑thought is stored here; they are concise, final NL outputs.
- **SFT datasets** (`Training-*.json`):
  - Feed `instruction`+`input` to the model; supervise on `output` (Verilog string).
  - Typical example:
    - `instruction`: "Based on the module-level description, generate the corresponding Verilog code."
    - `input`: "Module-level description: …"
    - `output`: "`timescale ...\nmodule ... endmodule"
- **Eval prompts** (`eval_data/*.json`):
  - Use as is for standardized benchmarking across tasks.

### Tips for navigation
- Start at `Hierarchy/` to explore by level; drill down to find module folders and their `intermediate_comment/` annotations.
- Use the `*_spec.json` for a quick overview of a module, and open the sibling `.v` to see the exact implementation.
- For training, begin with `Training-CodeComp.json` to see the exact SFT schema and outputs.

### Upstream documentation
- Overview and counts for Chip/IP/Module/RISC‑V levels, sourcing and keyword lists are documented here: [DeepCircuitX: Source RTL code](https://zeju.gitbook.io/lcm-team/deepcircuitx/souce-rtl-code).

If you need block‑level segmentation or richer annotations, consider populating the `*_blocks.json` files next to each module to map logical RTL sections to explanations.


@misc{li2025deepcircuitxcomprehensiverepositoryleveldataset,
      title={DeepCircuitX: A Comprehensive Repository-Level Dataset for RTL Code Understanding, Generation, and PPA Analysis}, 
      author={Zeju Li and Changran Xu and Zhengyuan Shi and Zedong Peng and Yi Liu and Yunhao Zhou and Lingfeng Zhou and Chengyu Ma and Jianyuan Zhong and Xi Wang and Jieru Zhao and Zhufei Chu and Xiaoyan Yang and Qiang Xu},
      year={2025},
      eprint={2502.18297},
      archivePrefix={arXiv},
      primaryClass={cs.LG},
      url={https://arxiv.org/abs/2502.18297}, 
}
