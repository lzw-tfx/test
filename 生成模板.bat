@echo off
chcp 65001 >nul
title 生成Excel导入模板

echo ========================================
echo    生成Excel导入模板
echo ========================================
echo.

python create_templates.py

if errorlevel 1 (
    echo.
    echo 模板生成失败！
    echo 请确认Python环境正常
    echo.
) else (
    echo.
    echo 模板生成成功！
    echo 文件位于：示例数据\ 目录
    echo.
)

pause
