package main

import (
	"fmt"

	"github.com/gocolly/colly/v2"
)

func main() {
	c := colly.NewCollector()
	c.OnHTML("table", func(e *colly.HTMLElement) {
		e.ForEach("tr", func(_ int, el *colly.HTMLElement) {
			fmt.Println(el.ChildText("td:nth-child(2)"), el.ChildText("td:nth-child(3)"))
		})
		fmt.Println("Scrapping Complete")
	})
	c.Visit("https://www.livecoinwatch.com/")
}
