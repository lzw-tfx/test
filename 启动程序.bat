@echo off
chcp 65001 >nul
title 一人一策记录本

echo ========================================
echo    一人一策记录本 - 征兵办信息管理系统
echo ========================================
echo.

echo 正在启动程序...
echo.

python main.py

if errorlevel 1 (
    echo.
    echo ========================================
    echo 程序启动失败！
    echo ========================================
    echo.
    echo 可能的原因：
    echo 1. Python未安装或未添加到环境变量
    echo 2. 依赖包未安装
    echo.
    echo 解决方法：
    echo 1. 确认Python已安装：python --version
    echo 2. 安装依赖包：pip install -r requirements.txt
    echo.
    pause
)
