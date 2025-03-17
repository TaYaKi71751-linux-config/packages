  -- Set up LuaSnip and nvim-cmp
  local cmp = require('cmp')
  local luasnip = require('luasnip')

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- Expand snippets with LuaSnip
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<C-Space>'] = cmp.mapping.complete(),
    },
  })
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node

luasnip.add_snippets("html", {
  s("jsp", {
    t({
      '<%@ page language="java" contentType="text/html; charset=UTF-8"',
      '    pageEncoding="UTF-8"%>',
      '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">',
      "<html>",
      "<head>",
      '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">',
      "    <title>Insert title here</title>",
      "</head>",
      "<body>",
      "",
      "</body>",
      "</html>"
    }),
  }),
})

luasnip.add_snippets("html", {
  s("html5", {
    t({"<!DOCTYPE html>", "<html>", "<head>"}),
    t({"", '    <meta charset="UTF-8">'}),
    t({"", "    <title>"}), i(1, "Insert title here"), t("</title>"),
    t({"", "</head>", "<body>"}),
    t({"", "</body>", "</html>"})
  }),
})


-- Function to extract the package name from the current directory
local function get_package_name()
  -- Get the current file's directory
  local current_dir = vim.fn.expand('%:p:h')
  
  -- Remove 'src/main/java/' from the directory path to form the package path
  local package_name = current_dir:gsub('\\','/'):gsub('.*/src/main/java/', ''):gsub('/', '.')

  -- Return the package name or a default one if empty
  return package_name ~= "" and "package " .. package_name
end

-- Function to extract the class name from the file
local function get_class_name()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false) -- Get all lines
  for _, line in ipairs(lines) do
    local class = line:match("public%s+class%s+([%w_]+)") -- Match class declaration
    if class then return class end
  end
		return ""
end

-- Adding snippets
luasnip.add_snippets("java", {
  s("servlet", {
    f(get_package_name, {}), t({";", "", 
      "import java.io.IOException;",
      "import java.io.PrintWriter;",
      "",
      "import javax.servlet.ServletException;",
      "import javax.servlet.annotation.WebServlet;",
      "import javax.servlet.http.HttpServlet;",
      "import javax.servlet.http.HttpServletRequest;",
      "import javax.servlet.http.HttpServletResponse;",
      "",
      "/**",
      " * Servlet implementation class "}), f(get_class_name, {}), t({"",
      " */",
      "@WebServlet(\"/"}), i(1, "ClassName"), t({"\")",
      "public class "}), f(get_class_name, {}), t({" extends HttpServlet {",
      "    private static final long serialVersionUID = 1L;",
      "",
      "    public "}), f(get_class_name, {}), t({"() {",
      "        super();",
      "    }",
      "",
      "    protected void doGet(HttpServletRequest request, HttpServletResponse response)",
      "            throws ServletException, IOException {",
      "    }",
      "",
      "    protected void doPost(HttpServletRequest request, HttpServletResponse response)",
      "            throws ServletException, IOException {",
      "        doGet(request, response);",
      "    }",
      "}"
    }),
  }),
})
