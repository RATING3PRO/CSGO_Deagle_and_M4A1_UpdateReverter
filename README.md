# CS:GO Update Reverter

这是一个基于 [KoNLiG/CSWeaponsAPI](https://github.com/KoNLiG/CSWeaponsAPI) 的 SourceMod 插件，旨在将特定的武器平衡性改动还原至 2021/2022 年之前的状态。

## 功能特性

1.  **沙漠之鹰 (Desert Eagle) 伤害还原**：
    *   将基础伤害恢复至 **63**（还原了 2021年9月更新中降至 53 的削弱）。
    *   这恢复了其在近中距离 "两枪身体击杀" (2-tap) 的能力。

2.  **M4A1-S 弹匣容量还原**：
    *   将弹匣容量恢复至 **25 发**（还原了 2022年6月更新中降至 20 的削弱）。
    *   将默认弹匣大小设置为 25。
    *   将备弹设置为 75（3 个弹匣）。

## 前置插件

*   [SourceMod](https://www.sourcemod.net/) 1.10 或更高版本。
*   [CSWeaponsAPI](https://github.com/KoNLiG/CSWeaponsAPI) (扩展与 Include 文件)。

## 编译和安装说明

1.  确保您的服务器上已经安装并运行 **CSWeaponsAPI** 扩展。
2.  将 `scripting/CSGO_UpdateReverter.sp` 文件放入 `addons/sourcemod/scripting/` 目录。
3.  运行 `./spcomp CSGO_UpdateReverter.sp` 进行编译。
4.  将编译生成的 `CSGO_UpdateReverter.smx` 文件放入 `addons/sourcemod/plugins/` 目录。
5.  重启服务器或在控制台输入 `sm plugins load CSGO_UpdateReverter.smx` 加载插件。

## 代码详情 

该插件使用 `CSWeaponsAPI` 直接在内存中修改武器数据，比使用 SDKHooks 动态修改伤害或弹匣更为高效且整洁：

*   `CSWeaponData.GetByClassName("weapon_deagle").Damage = 63;`
*   `CSWeaponData.GetByClassName("weapon_m4a1_silencer").MaxClip1 = 25;`

这种方法直接更改了游戏内部的武器定义。
