#set page(height: 100em)

#let b_table(columns: (auto,) * 4, row, footer: ()) = {
  show table.cell: it => {
    if it.y == 0 {
      set align(center + horizon)
      strong(it, delta: 600)
    } else if it.x == 0 and it.y > 0 {
      set align(left + horizon)
      strong(it, delta: 300)
    } // else if it.body == [] {
    // Replace empty cells with 'N/A'
    //pad(..it.inset)[_N/A_]
    //}
    else {
      set align(left + horizon)
      it
    }
  }

  table(
    columns: columns,
    stroke: none,
    column-gutter: .5em,
    row-gutter: .5em,

    //inset: (right: 1.5em),
    ..row.intersperse(
      table.hline(
        // 横线
        stroke: 0.3pt + gray,
      ),
    ),

    // 消除底线
    table.hline(
      y: calc.ceil(row.len() / columns.len()), // 行的索引从 0 开始的
      stroke: 0pt + black,
    ),


    // 表尾
    ..if footer != () {
      (
        table.footer(..footer),
      )
    },
  )
}

#b_table(
  columns: (auto,) * 4,
  (
    [类比],
    [常用选项],
    [作用说明],
    [示例],
    table.cell(rowspan: 9)[请求控制],
    `-X [method]`,
    [指定请求方法，如 `GET`、`POST`、`PUT`、`DELETE`],
    `-X POST https://api.example.com/users`,
    `-H [header: value]`,
    [自定义请求头，常用于指定 `Content-Type` 等],
    `-H "Content-Type: application/json"`,
    `-d [data]`,
    [发送 POST 请求的数据（自动将请求转为 POST）],
    `-d "name=John&age=30"`,
    `-b [data/filename]`,
    [设置 Cookie，可从文件读取],
    `-b "session=abc123"`,
    `-x [protocol://host:port]`,
    [使用代理服务器],
    `-x http://proxy.example.com:8080`,
    `-L`,
    [跟随服务器的重定向指令（如 301/302）],
    `-L http://example.com/redirect`,
    `-u [user:password]`,
    [提供服务器认证的用户名和密码],
    `-u "admin:secret"`,
    `-A [user-agent]`,
    [自定义 User-Agent 头，模拟浏览器],
    `-A "Mozilla/5.0"`,
    `--limit-rate [speed]`,
    [限制数据传输的速率],
    `--limit-rate 1M`,
    table.cell(rowspan: 3)[信息查看],
    `-v`,
    [显示详细的通信过程（请求和响应首部），调试利器],
    `-v https://example.com`,
    `-i`,
    [在输出中包含 HTTP 响应头信息],
    `-i https://example.com`,
    `-I`,
    [仅获取 HTTP 响应头信息（HEAD 请求）],
    `-I https://example.com`,
    table.cell(rowspan: 3)[输出控制],
    `-o [filename]`,
    [将服务器响应保存到指定文件],
    `-o myfile.html https://example.com`,
    `-O`,
    [将服务器响应保存到文件，并使用远程文件名],
    `-O https://example.com/file.zip`,
    `-s`,
    [静默模式，不显示进度条或错误信息],
    `-s https://api.example.com/data`,
    table.cell(rowspan: 5)[其他],
    `-m [seconds]`,
    [整个请求的最大执行时间（秒）],
    `-m 30 https://example.com`,
    `--connect-timeout [seconds]`,
    [连接超时时间（秒）],
    `--connect-timeout 5 https://example.com`,
    `-C -`,
    [断点续传（自动检测已下载部分）],
    `-C - -O https://example.com/large.iso`,
    `-k`,
    [允许不安全的 SSL 连接，跳过证书验证],
    `-k https://self-signed.badssl.com`,
    `--libcurl [file]`,
    [将命令转换为 libcurl 的 C 代码],
    `--libcurl curl.c https://example.com`,
  ),
)
