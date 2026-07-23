#!/bin/bash

# 创建目录
mkdir -p /workspace/models/loras

aria2c -c -x 16 -s 16 "https://cnb.cool/outlu/models/loras/-/lfs/6c4384005d5d2c607ae5913f5a5beddc1c1be7d580ded52abfe42f62e29d8088\
?name=LTX-2.3%20-%20Jiggle%20Tits%20v3.2.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/TenStrip/LTX2.3_DMD_Lora/-/lfs/4543ac32e5a3d1b28dac62a956987cced24311a54710d6e175f6fd607a59c46d\
?name=LTX2.3_DMD_reshaped_r256.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/ai-models/Alissonerdx/LTX-Best-Face-ID/-/lfs/7aaab2f1bff2af121e0751120ad16a3e443b4223a04b78c51740029d25f17994\
?name=Best_FaceID_v1.0_LoRA.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/outlu/models/loras/-/lfs/f67ad8e0151b73736d76444a482432c9458e291174b9c2a26c5ea53bad73a48f\
?name=WalkV1_0_LTX23_I2V-000040.comfy.safetensors" \
-d "/workspace/models/loras"
aria2c -c -x 16 -s 16 "https://cnb.cool/outlu/models/loras/-/lfs/b51a03321bfea9ab506db2f167a975af77d51ee34e263b1f664f5147d5b6ef23\
?name=bounceV2_5_LTX23_I2V.comfy.safetensors" \
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


# 创建软链接
echo "正在创建软链接..."
if [ -d "/ComfyUI" ]; then
    # 如果 /ComfyUI 目录存在，连接到 /ComfyUI/models/ 下
    mkdir -p /ComfyUI/models/loras
    ln -sf /workspace/models/loras/* /ComfyUI/models/loras/ 2>/dev/null || echo "No loras models found"
else
    # 如果 /ComfyUI 目录不存在，连接到 /workspace/ComfyUI/models/ 下
    mkdir -p /workspace/ComfyUI/models/loras
    ln -sf /workspace/models/loras/* /workspace/ComfyUI/models/loras/ 2>/dev/null || echo "No loras models found"
fi
echo "所有模型链接完成！"
