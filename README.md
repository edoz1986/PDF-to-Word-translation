# Qwen Translate - 文档翻译工具

基于 DeepSeek API 的文档翻译工具，支持 PDF 转 Word、翻译、表格格式化、目录修复等功能。

## 系统要求

- Windows 操作系统
- Python 3.11 或更高版本
- DeepSeek API 密钥

## 安装步骤

1. **安装 Python**
   - 下载并安装 Python 3.11+： https://www.python.org/downloads/
   - 安装时勾选 "Add Python to PATH"

2. **配置 API 密钥**
   - 复制 `config.ini.example` 为 `config.ini`
   - 编辑 `config.ini`，填入你的 DeepSeek API 密钥：
   ```ini
   [API]
   api_key=sk-your_api_key_here
   model=deepseek-chat
   max_workers=5
   timeout=120
   ```

3. **安装依赖**
   - 双击运行 `setup.bat`
   - 等待依赖安装完成

## 使用方法

### 方式一：综合处理（推荐）
运行 `0_PDF_to_Final_DOCX.bat`
- 自动完成：PDF转Word → 翻译 → 表格格式化 → 目录修复
- 只生成一个 `_final.docx` 文件

### 方式二：分步处理
1. `1_PDF_to_DOCX_Convert.bat` - PDF 转 Word
2. `2_DOCX_Translate.bat` - 翻译文档
3. `3_DOCX_Fix_Tables.bat` - 修复表格格式
4. `4_DOCX_Fix_TOC.bat` - 修复目录格式

### 操作方式
- **双击运行**：自动搜索并处理当前文件夹中的所有文档
- **拖拽文件**：处理指定的文档文件

## 文件说明

### Bat 文件
- `setup.bat` - 安装依赖
- `0_PDF_to_Final_DOCX.bat` - 综合处理（PDF → 最终文档）
- `1_PDF_to_DOCX_Convert.bat` - PDF 转换
- `2_DOCX_Translate.bat` - 文档翻译
- `3_DOCX_Fix_Tables.bat` - 表格格式化
- `4_DOCX_Fix_TOC.bat` - 目录修复

### Python 文件
- `ENtranslator.py` - 核心翻译模块
- `process_all_in_one.py` - 综合处理逻辑
- `convert_pdf_only.py` - PDF 转换逻辑
- `translate_only.py` - 翻译逻辑
- `fix_tables_only.py` - 表格修复逻辑
- `fix_toc_only.py` - 目录修复逻辑

### 配置文件
- `config.ini` - API 配置（需要自行创建）
- `config.ini.example` - 配置示例
- `requirements.txt` - Python 依赖列表

## 输出文件命名规则

- PDF 转换：`_converted.docx`
- 翻译：`_translated.docx`
- 表格修复：`_fixed.docx`
- 目录修复：`_toc_fixed.docx`
- 综合处理：`_final.docx`

## 注意事项

1. 原始文件不会被覆盖
2. 需要稳定的网络连接（调用 DeepSeek API）
3. 大文件翻译可能需要较长时间
4. 请确保 API 密钥有足够的额度

## 常见问题

**Q: 提示 "配置文件不存在"**
A: 请复制 `config.ini.example` 为 `config.ini` 并填入 API 密钥

**Q: 提示 "Python not found"**
A: 请安装 Python 并确保已添加到系统 PATH

**Q: 翻译失败或超时**
A: 检查网络连接和 API 密钥是否有效

## 技术说明

- 使用 `pdf2docx` 进行 PDF 转换
- 使用 `python-docx` 处理 Word 文档
- 使用 DeepSeek API 进行翻译
- 支持并发翻译提高效率
