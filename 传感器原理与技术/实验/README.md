# 传感器原理与技术 实验_2026春学期

## 目录结构

```
实验/
├── source/       # 基础实验源码
│   ├── ADC/
│   │   └── MDK-ARM/          # Keil µVision 工程文件 *这也是你需要的文件*
│   ├── LED/
│   │   └── MDK-ARM/
│   ├── USART/
│   │   └── MDK-ARM/
│   └── ...                    # 更多实验（详见下文）
├── modules/      # 传感器模块实验源码
│   ├── DHT11/
│   │   └── MDK-ARM/
│   ├── mpu-6050/
│   │   └── MDK-ARM/
│   └── ...                    # 更多模块（详见下文）
└── README.md
```

## 实验操作步骤

### 第一步：安装软件

按照实验指导书**第一章**的内容，安装软件与环境：


### 第二步：确定实验源码位置

根据课本对应实验内容，在以下两类目录中找到对应的实验文件夹：

| 类别 | 路径 | 实验列表 |
|------|------|----------|
| **基础实验** | `source/` | ADC, DAC, EXTI, I2C, KEY, LCD, LCD_Light, LED, RTC, SPI, Systick_Led, TIMER, USART, Voltmeter, 485, CAN, CAN_LOOPBACK, BuzzER, LwIP, Motor, NAND_Flash, NOR_Flash, OV2640, SD_FATFS, Temperature, ZLG72128 |
| **传感器模块** | `modules/` | DHT11, FAN, FIRE, IR, LIGHT, mpu-6050, MQ5, qmc5883l, RELAY, SHOT, TOUCH, Ultrasonic, Voice_Control |

例如：要完成 LED 实验，进入 `source/LED/MDK-ARM/` 目录。

### 第三步：打开工程并编译

1. 进入实验对应文件夹下的 `MDK-ARM/` 目录
2. 双击 `.uvprojx` 文件，用 Keil µVision 打开工程
3. 在 µVision 中点击 **Project → Build Target (F7)** 编译工程
4. 编译成功后，会在 `MDK-ARM/` 目录下生成 `.hex` 文件

### 第四步：连接开发板

按照实验指导书的硬件连接说明，将开发板与 PC 连接：
- 使用 USB 线连接开发板
- 确认 USB 驱动已正确安装，设备管理器中可识别

### 第五步：下载程序

1. 在 µVision 中点击 **Flash → Download (F8)**
2. 等待下载完成提示
3. 观察开发板运行结果，验证实验功能

## 注意事项

- 该readme为ai生成，可能存在微小错误 :)
- 每个实验文件夹下的 `MDK-ARM/` 目录已包含完整的 Keil 工程，无需额外配置
- 如果编译报错，请检查 Keil MDK-ARM 版本是否为 v5 及以上
- 部分实验需要跳线连接，请仔细对照实验指导书的硬件连接图
- 下载程序前确保开发板已上电且驱动正常
