# Megatron-LM Porting: Progress, Demos & Next Steps

**Task:** Port existing and novel models into the **Megatron-LM** framework.

---

## Subproblems (6-part plan)

1. Running a basic training on multi-GPU (GPT-OSS 20B architecture with mock data) — *Pre-training*  
2. Training on a real dataset — *Pre-training*  
3. Model weight tying — *Extended Pre-training*  
4. Fine-tuning  
5. Porting novel elements (e.g., **Gated Attention**)  
6. Exploring different optimizations  

---

## Repository Layout

- `gpt_oss_trainer_mock_data.ipynb` — demo with mock data  
- `gpt_oss_trainer.ipynb` — demo with real dataset  
- `data/` — Pre-processed dataset(Tiny stories) with 10k samples  
- `run_trainer_mock_data.sh` — shell script to run demo with mock dataset  
- `run_trainer.sh` — shell script to run demo with real dataset  

---


> **GPU Run** : I tested the script on Runpod (4xA100 SXM)
---

## Current Status

- ✅ **Milestone 1:** Multi-GPU pre-training demo on mock data  
- ✅ **Milestone 2:** Multi-GPU pre-training on a real dataset (small shard)  
- 📓 Both implemented as **Jupyter notebooks (`.ipynb`)**  
  - Instructions are provided inline inside each notebook  
  - Simply execute each shell cell in order  

<div style="border:2px #ff4d4d; padding:15px; border-radius:8px; background-color:#ffe6e6;">
  <b style="color:#cc0000;">⚠️ Special note for (real dataset):</b>
  <ol>
    <li>Run the <b>first two cells of the notebook</b></li>
    <li>Move the prepared <code>data/</code> folder into your <code>Megatron-LM/</code> folder:
      <pre><code>mv data/ Megatron-LM/data/</code></pre>
    </li>
    <li>Resume the notebook and continue running the cells</li>
  </ol>
</div>

---

## TODOs / Roadmap
- [ ] **Weight tying (Milestone 3)** — load pre-trained weight from huggingface into the architecture
- [ ] **More runtime arguments** — Make the script more flexible with runtime arguments, current state is pathetic, also proper docstrings
- [ ] **Validation run implementation** — periodic eval on held-out data  
- [ ] **Experiment tracking** — integrate W&B  
- [ ] **Optimization sweeps**  
  - GPU scaling and different parallelization configuration  
  - Batch size, sequence length, and other optimizations
- [ ] **Fine-tuning (Milestone 4)** — LORA and SFT  
- [ ] **Novel elements (Milestone 5)** — i.e. Gated Attention 
---

## Acknowledgements

Work built on top of [Megatron-LM](https://github.com/NVIDIA/Megatron-LM).  
