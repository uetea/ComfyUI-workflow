#!/bin/bash

# 创建目录
mkdir -p /workspace/models/{checkpoints,text_encoders,loras}

echo "开始下载 DasiwaLTX23_goldenLaceV3.safetensors..."
aria2c -c -x 16 -s 16 "https://cnb.cool/comfyui114514_file3/DaSiWa-LTX2.3/-/lfs/86e14fd4eaf24ae39d3bb2497e9a86c723888a9172cffeca31c9730dc2c126e2\
?name=DasiwaLTX23_goldenLaceV3-fp8.safetensors" \
-d "/workspace/models/checkpoints"

aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/TenStrip/LTX2.3-10Eros/-/lfs/0d76ceae7c1e8cb87dc88c29f37f171819e3bda0d605f196cd5daa1d3cdfd008\
?name=gemma-3-12b-it-ablit-norms-biproj-fp8mixed.safetensors" \
-d "/workspace/models/text_encoders"

aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/TenStrip/LTX2.3_Distilled_Lora_1.1_Experiments/-/lfs/e970f64a2ce5469491fb1714a3fa72c8b606fa82affff0531e836dbc91d31f34\
?name=ltx-2.3-22b-distilled-lora-1.1_fro90_ceil72_condsafe.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/BigBomb/Models_Collection/-/lfs/d91d2e783879601bc7a638c978f8257e5ed340c012e7d668b7cd32de443ff2e1\
?name=DR34ML4Y_LTXXX_V2.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/BigBomb/Models_Collection/-/lfs/a741c30110cfda9f13f0cbcaf97649f18a53adc05e31ec745f215994956f4e0f\
?name=DaSiWa_LTX23_NSFW_Bodyphysics_Fluid_Motion_Enhancer_v01.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/BigBomb/Models_Collection/-/lfs/b037a2fae053ee5f1b50d57120fe4e6acb680f654cbdc1f0a01c5189e2393f57\
?name=nsfw_riding_backshot_frontshot_ltx23_v1.0.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/BigBomb/Models_Collection/-/lfs/6832612c925d30a49b62505fc08bda3e0d6d1c6cebd2ee81e8df03df844a4ecd\
?name=OmniNFT_converted_lora.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/BigBomb/Models_Collection/-/lfs/36721b3988c468afbec2f5bc52eb534fc6a3398fcf150303eba24f27d9da2974\
?name=ltx23_edit_anything_global_rank128_v1_9000steps_adamw.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/outlu/models/loras/-/lfs/f67ad8e0151b73736d76444a482432c9458e291174b9c2a26c5ea53bad73a48f\
?name=WalkV1_0_LTX23_I2V-000040.comfy.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/outlu/models/loras/-/lfs/6c4384005d5d2c607ae5913f5a5beddc1c1be7d580ded52abfe42f62e29d8088\
?name=LTX-2.3%20-%20Jiggle%20Tits%20v3.2.safetensors" \
-d "/workspace/models/loras"

# 创建软链接
echo "正在创建软链接..."
if [ -d "/ComfyUI" ]; then
    # 如果 /ComfyUI 目录存在，连接到 /ComfyUI/models/ 下
    mkdir -p /ComfyUI/models/{checkpoints,text_encoders,loras,unet}
    ln -sf /workspace/models/checkpoints/* /ComfyUI/models/checkpoints/ 2>/dev/null || echo "No checkpoints models found"
    ln -sf /workspace/models/checkpoints/* /ComfyUI/models/unet/ 2>/dev/null || echo "No unet models found"
    ln -sf /workspace/models/text_encoders/* /ComfyUI/models/text_encoders/ 2>/dev/null || echo "No text_encoders models found"
    ln -sf /workspace/models/loras/* /ComfyUI/models/loras/ 2>/dev/null || echo "No loras models found"
else
    # 如果 /ComfyUI 目录不存在，连接到 /workspace/ComfyUI/models/ 下
    mkdir -p /workspace/ComfyUI/models/{checkpoints,text_encoders,loras,unet}
    ln -sf /workspace/models/checkpoints/* /workspace/ComfyUI/models/checkpoints/ 2>/dev/null || echo "No checkpoints models found"
    ln -sf /workspace/models/checkpoints/* /workspace/ComfyUI/models/unet/ 2>/dev/null || echo "No unet models found"
    ln -sf /workspace/models/text_encoders/* /workspace/ComfyUI/models/text_encoders/ 2>/dev/null || echo "No text_encoders models found"
    ln -sf /workspace/models/loras/* /workspace/ComfyUI/models/loras/ 2>/dev/null || echo "No loras models found"
fi
echo "所有模型链接完成！"
