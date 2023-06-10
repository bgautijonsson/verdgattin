#' Title
#'
#' @return
get_data <- function() {
    url <- "https://www.verdgattin.is/"
    
    page <- read_html(url)
    
    text <- page |> 
        html_element(xpath = '//*[@id="__NEXT_DATA__"]') |> 
        html_text() 
    
    data <- text |> 
        fromJSON() |> 
        as.list() |> 
        tibble() |> 
        slice(1) |> 
        unnest_wider(everything()) |> 
        select(pageProps) |> 
        unnest_wider(everything())
    
    
    chart_data <- data |> 
        select(chartData) |> 
        unnest_longer(everything()) |> 
        unnest_wider(chartData) |> 
        unnest_longer(prices, indices_to = "store") |> 
        unnest_longer(prices, indices_to = "date") |> 
        select(
            name,
            date,
            store,
            prices, 
            image_url
        )  |> 
        mutate(
            prices = parse_number(prices),
            date = as_date(date),
            store = str_to_title(store)
        ) 
    
    chart_data
}