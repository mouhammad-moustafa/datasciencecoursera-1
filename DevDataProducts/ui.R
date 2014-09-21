shinyUI(pageWithSidebar(
    headerPanel("Foo"),
    sidebarPanel(
        h1("Llala")
    ),
    mainPanel(
        h3("Main panel"),
        code("some code here")
    )
))