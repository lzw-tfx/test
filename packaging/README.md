打包说明 (✅ 目标: 在 麒麟 操作系统 上运行)

选项 A — 在麒麟或其他 Linux 机器上本地打包（推荐）
1. 在目标机器（麒麟）上安装 Python 3.11、pip，并安装系统依赖：
   sudo apt update && sudo apt install -y libxcb1 libx11-6 libxcb-xinerama0 libxrender1 libxext6 libgl1 libxkbcommon0 libglib2.0-0
2. 在项目根目录运行：
   python -m pip install --upgrade pip
   pip install -r requirements.txt pyinstaller
3. 使用打包规格文件：
   pyinstaller --noconfirm --clean --windowed --name workbook main.py
   或使用项目中提供的 `packaging/pyinstaller.spec`：
   pyinstaller packaging/pyinstaller.spec
4. 产物位于 `dist/workbook/`，复制到麒麟机器上运行 `packaging/run_app.sh` 来启动程序。

选项 B — 在 Windows 上通过 Docker 构建 Linux 可执行（适用于安装了 Docker 的情况）
1. 在 Windows 上安装并启用 Docker Desktop（或使用 WSL2），打开项目根目录。
2. 运行：
   ./packaging/build.sh /absolute/path/to/output_dir
   构建完成后，输出将位于指定目录（包含 dist/workbook/ 或 dist_app.tar.gz）。
3. 将生成的文件夹或 tar 包传输到麒麟机器，解压并运行 `packaging/run_app.sh`。

常见问题 ⚠️
- 运行时报错找不到 Qt 平台插件（如 libqxcb.so）：确保系统安装了 `libxcb-xinerama0`/`libxcb1` 等依赖，或者在打包时把 PyQt6 的 plugins 目录包含到 dist 中。
- 如果界面无法显示，尝试在运行前导出环境变量：
  export QT_QPA_PLATFORM_PLUGIN_PATH=/path/to/dist/workbook/PyQt6/Qt/plugins/platforms

需要我做的下一步？
- 我可以先在本地为你添加这些打包文件（已完成），并且如果你有 Docker、我可以尝试在容器中构建并把产物放到你的 workspace；
- 或者我可以列出需要在麒麟上运行的完整命令和安装包清单，你在麒麟上运行后告诉我结果。

如果要我继续构建，请告诉我：
1) 你是否有 Docker 可用在当前环境？
2) 是否同意我在容器中运行打包并把生成的产物放到项目 `dist_linux`（或你指定的位置）？
