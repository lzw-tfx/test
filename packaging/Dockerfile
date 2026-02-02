FROM python:3.11-slim

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install common system libraries required by PyQt6 and for running GUI apps
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libxcb1 \
        libx11-6 \
        libxcb-xinerama0 \
        libxrender1 \
        libxext6 \
        libgl1 \
        libxkbcommon0 \
        libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project into container
COPY . /app

# Upgrade pip and install dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt pyinstaller

# Run PyInstaller to create a one-folder build (safer for PyQt6 apps)
# Include example data and database folder into the bundle
RUN pyinstaller --noconfirm --clean --windowed \
    --add-data "示例数据:示例数据" \
    --add-data "database:database" \
    --name workbook main.py

# Pack the dist folder into an archive for easy extraction
RUN tar -czf /app/dist_app.tar.gz -C dist workbook

# Default command - drop to shell so user can copy artifacts
CMD ["/bin/bash"]
