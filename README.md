# Qwen Translate - 文档翻译工具

基于通义千问(Qwen)和 DeepSeek API 的文档翻译工具，支持 PDF 转 Word、翻译、表格格式化、双语对照等功能。

## 系统要求

- Windows 操作系统
- Python 3.11 或更高版本
- 通义千问 API 密钥 或 DeepSeek API 密钥

## 安装步骤

1. **安装 Python**
   - 下载并安装 Python 3.11+： https://www.python.org/downloads/
   - 安装时勾选 "Add Python to PATH"

2. **配置 API 密钥**
   - 复制 `config.ini.example` 为 `config.ini`
   - 编辑 `config.ini`，填入你的 API 密钥：
   ```ini
   [API]
   api_key=sk-your_api_key_here
   model=qwen-turbo
   max_workers=5
   timeout=120
   ```

3. **安装依赖**
   - 双击运行 `setup.bat`
   - 等待依赖安装完成

## 使用方法

### 方式一：综合处理（推荐）
运行 `0_PDF_to_Final_DOCX.bat`
- 自动完成：PDF转Word → 翻译 → 表格格式化
- 只生成一个 `_final.docx` 文件

### 方式二：分步处理
1. `1_PDF_to_DOCX_Convert.bat` - PDF 转 Word
2. `2_DOCX_Translate.bat` - 翻译文档（仅英文）
3. `3_DOCX_Fix_Tables.bat` - 修复表格格式
4. `4_DOCX_Bilingual_Translate.bat` - 双语翻译（中英对照）

### 方式三：双语翻译
运行 `4_DOCX_Bilingual_Translate.bat`
- 保留中文原文，添加英文翻译
- 生成 `_Bilingual.docx` 文件
- 适合需要中英对照的场景

### 操作方式
- **双击运行**：自动搜索并处理当前文件夹中的所有文档
- **拖拽文件**：处理指定的文档文件

## API 配置说明

### 通义千问（默认）
```ini
[API]
api_key=sk-your-qwen-key
model=qwen-turbo
max_workers=5
timeout=120
```

### DeepSeek
```ini
[API]
api_key=sk-your-deepseek-key
model=deepseek-chat
max_workers=10
timeout=120
```

### 多 Key 配置（提高并发）
```ini
[API]
api_key=sk-key1,sk-key2,sk-key3
model=qwen-turbo
max_workers=5
timeout=120
```

### 模型选择

| 服务商 | 模型名称 | 特点 |
|--------|---------|------|
| 通义千问 | qwen-turbo | 快速、便宜，适合大多数场景 |
| 通义千问 | qwen-plus | 性能均衡 |
| 通义千问 | qwen-max | 最强性能，价格较高 |
| DeepSeek | deepseek-chat | 通用对话模型，不限制并发 |
| DeepSeek | deepseek-coder | 代码专用模型 |
| DeepSeek | deepseek-reasoner | 推理模型 |

## 文件说明

### Bat 文件
- `setup.bat` - 安装依赖
- `0_PDF_to_Final_DOCX.bat` - 综合处理（PDF → 最终文档）
- `1_PDF_to_DOCX_Convert.bat` - PDF 转换
- `2_DOCX_Translate.bat` - 文档翻译（仅英文）
- `3_DOCX_Fix_Tables.bat` - 表格格式化
- `4_DOCX_Bilingual_Translate.bat` - 双语翻译（中英对照）

### Python 文件
- `ENtranslator.py` - 核心翻译模块（仅英文）
- `BLtranslator_word_api.py` - 双语翻译模块（中英对照）
- `process_all_in_one.py` - 综合处理逻辑
- `convert_pdf_only.py` - PDF 转换逻辑
- `translate_only.py` - 翻译逻辑
- `fix_tables_only.py` - 表格修复逻辑

### 配置文件
- `config.ini` - API 配置（需要自行创建）
- `config.ini.example` - 配置示例
- `requirements.txt` - Python 依赖列表

## 输出文件命名规则

- PDF 转换：`_converted.docx`
- 翻译（仅英文）：`_translated.docx`
- 表格修复：`_fixed.docx`
- 双语翻译：`_Bilingual.docx`
- 综合处理：`_final.docx`

## 双语翻译格式说明

双语翻译会保留原文并添加英文翻译：

- **标题格式**：`中文标题/English Title`（同行显示）
- **正文格式**：
  ```
  中文段落内容
  English paragraph translation
  ```
- **表格格式**：单元格内显示 `中文内容
英文翻译`

## 高级功能

### 文字去重
双语翻译会自动识别文档中重复的文字块，只翻译一次，然后复制到所有重复位置，大幅减少 API 调用量和翻译时间。

### 断点续传
翻译过程中会每 5 项自动保存进度，如果中断可以从中断处继续翻译。

### 并发翻译
- 通义千问：建议 3-5 并发（受 500 QPM 限制）
- DeepSeek：建议 10-20 并发（无限制）

## 注意事项

1. 原始文件不会被覆盖
2. 需要稳定的网络连接（调用 API）
3. 大文件翻译可能需要较长时间
4. 请确保 API 密钥有足够的额度
5. `config.ini` 包含敏感信息，已加入 `.gitignore` 不会被上传

## 常见问题

**Q: 提示 "配置文件不存在"**
A: 请复制 `config.ini.example` 为 `config.ini` 并填入 API 密钥

**Q: 提示 "Python not found"**
A: 请安装 Python 并确保已添加到系统 PATH

**Q: 翻译失败或超时**
A: 检查网络连接和 API 密钥是否有效，或增加 timeout 值

**Q: 如何切换通义千问和 DeepSeek？**
A: 修改 `config.ini` 中的 `model` 参数即可自动切换

**Q: 双语翻译和单语翻译有什么区别？**
A: 双语翻译保留中文原文并添加英文，单语翻译只保留英文

## 技术说明

- 使用 `pdf2docx` 进行 PDF 转换
- 使用 `python-docx` 处理 Word 文档
- 支持通义千问和 DeepSeek API
- 自动识别 API 类型并切换端点
- 支持并发翻译提高效率
- 智能文字去重减少 API 调用
