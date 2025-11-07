# ICPC Team Notebook - LVTNB.Raumanian67

![Team Logo](lvt.png)

Team Notebook cho đội **LVTNB.Raumanian67** từ **HSGS Luong Van Tuy - Ninh Binh**

## Thành viên

1. **Giang Truong Vu**
2. **Thai Son Huu Vu**
3. **Nhat Minh Doan**

## Cài đặt

### Yêu cầu

- **LaTeX**: Cài đặt TeX Live (Linux/Windows) hoặc MacTeX (macOS)
  - Ubuntu/Debian: `sudo apt-get install texlive-full`
  - macOS: `brew install --cask mactex`
  - Windows: Tải TeX Live từ https://tug.org/texlive/

- **Python Pygments** (cho minted package):
  ```bash
  pip install Pygments
  ```

### Build PDF

1. Cấp quyền thực thi cho script:
   ```bash
   chmod +x build.sh
   ```

2. Chạy script build:
   ```bash
   ./build.sh
   ```

3. File PDF sẽ được tạo tại: `notebook.pdf`

### Build thủ công

Nếu script không chạy được, bạn có thể build thủ công:

```bash
pdflatex -shell-escape notebook.tex
pdflatex -shell-escape notebook.tex
```

(Chạy 2 lần để table of contents hiển thị đúng)

## Cấu trúc dự án

```
.
├── notebook.tex         # File LaTeX chính
├── lvt.png             # Logo đội
├── build.sh            # Script build tự động
├── code/               # Thư mục chứa code (sẽ tạo sau)
│   ├── data-structures/
│   ├── graph/
│   ├── math/
│   ├── string/
│   ├── geometry/
│   ├── dp/
│   └── misc/
└── README.md           # File này

```

## Thêm thuật toán vào notebook

### Cách 1: Inline code trong LaTeX

Thêm code trực tiếp vào notebook.tex:

```latex
\section{Data Structures}

\subsection{Segment Tree}
\begin{minted}{cpp}
struct SegmentTree {
    vector<int> tree;
    int n;

    SegmentTree(int size) : n(size) {
        tree.resize(4 * n);
    }

    void update(int node, int start, int end, int idx, int val) {
        // Implementation here
    }
};
\end{minted}
```

### Cách 2: Include từ file

Tạo file code trong thư mục `code/` và include vào:

```latex
\section{Graph Algorithms}

\subsection{Dijkstra}
\inputminted{cpp}{code/graph/dijkstra.cpp}
```

## Tùy chỉnh

### Thay đổi màu sắc

Trong `notebook.tex`, tìm phần định nghĩa màu:

```latex
\definecolor{primaryblue}{RGB}{0,51,102}
\definecolor{accentgold}{RGB}{255,215,0}
```

### Thay đổi ngôn ngữ code

Mặc định là C++, có thể đổi sang Python, Java:

```latex
\begin{minted}{python}
# Python code here
\end{minted}

\begin{minted}{java}
// Java code here
\end{minted}
```

## Troubleshooting

### Lỗi "minted not found"
```bash
pip install Pygments
```

### Lỗi "shell-escape"
Đảm bảo dùng flag `-shell-escape` khi compile:
```bash
pdflatex -shell-escape notebook.tex
```

### Lỗi font tiếng Việt
File hiện tại hỗ trợ UTF-8, nếu cần font đẹp hơn, thêm:
```latex
\usepackage{fontspec}
\setmainfont{Times New Roman}
```

## License

Free to use for ICPC training and competition purposes.