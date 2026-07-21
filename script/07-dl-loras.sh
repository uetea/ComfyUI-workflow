#!/bin/bash

# 创建目录
mkdir -p /workspace/models/loras
echo "开始下载 Loras..."
aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/SulphurAI/Sulphur-2-base/-/lfs/e970f64a2ce5469491fb1714a3fa72c8b606fa82affff0531e836dbc91d31f34\
?name=ltx-2.3-22b-distilled-lora-1.1_fro90_ceil72_condsafe.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/Kijai/LTX2.3_comfy/-/lfs/204b491f76da5c7ef0998dee636b4db695a00d28729ebccfda8dfdc3c37df63c\
?name=LTX-2.3-OmniNFT-RL-Lora_bf16.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/BigBomb/Models_Collection/-/lfs/36721b3988c468afbec2f5bc52eb534fc6a3398fcf150303eba24f27d9da2974\
?name=ltx23_edit_anything_global_rank128_v1_9000steps_adamw.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/BigBomb/Models_Collection/-/lfs/150ec404e517562a8e0692f4a9401c740cc0199793dc608d168490ba2d958203\
?name=LTX2.3_reasoning_I2V_V3.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/fuliai/comfyui_source/-/lfs/9e301d35a97dc8188a2287290e08283c7bccd29bc4deaf0f37f65ce98fc9a789\
?name=Penile_Praxis_V4.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/LiconStudio/Ltx2.3-VBVR-lora-I2V/-/lfs/4cb77bc088b04fd69fe5a711356aec05e1a9d503b47e6e252a7f2577c7716a18\
?name=Ltx2.3-Licon-VBVR-I2V-390K-R32.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/WarmBloodAban/Singularity_LTX-2.3_OmniCine_Preview0.1/-/lfs/d8f21cfa7dabb993aad726d33f91b2fcde8fb7481165af58a154bf1444995544\
?name=Singularity%20LTX-2.3%20%20OmniCine%20Preview%20v0.1.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/joyfox/LTX2.3-ICEdit-Insight/-/lfs/b3d73d7bf737dcfeba6bfa310105532f8f34aa23a3f9e01cb9f873341b8ef88f\
?name=ltx2.3-ic-subtitles-remove-general.safetensors" \
-d "/workspace/models/loras"

# 创建软链接
echo "正在创建软链接..."
if [ -d "/ComfyUI" ]; then
    # 如果 /ComfyUI 目录存在，连接到 /ComfyUI/models/ 下
    mkdir -p /ComfyUI/models/loras
    ln -sf /workspace/models/loras/* /ComfyUI/models/loras/
else
    # 如果 /ComfyUI 目录不存在，连接到 /workspace/ComfyUI/models/ 下
    mkdir -p /workspace/ComfyUI/models/loras
    ln -sf /workspace/models/loras/* /workspace/ComfyUI/models/loras/
fi
echo "所有模型链接完成！"
