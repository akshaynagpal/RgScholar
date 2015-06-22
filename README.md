# RgScholar
Google Scholar API in R

API to search Google Scholar for research papers based on user input and search filters.

##Installation
`> library(devtools)`
`> install_github('akshaynagpal/rgscholar')`
`> library(RgScholar)` 


##Usage
It can be used simply by specifying the query as shown below:

`query_1 <- google_Scholar("heart rate")` 

Search filters can also be applied to have a more focused search as shown in the below query which searches Google Scholar for research papers containing the terms "heart rate", published in journal *Nature* between the years *1989* and *2015*

`query_2 <- google_Scholar("heart rate",year_low = 1989, year_high = 2015,journal = "nature")`

###Arguments

`user_query` Search term(s) given by user separated by space    
`year_low`	 Lower limit of the year filter (optional). Default Value = NULL    
`year_high`	 Upper limit of the year filter (optional). Default Value = NULL    
`journal`	   Limit search to a specific journal (optional). Default value = NULL    


###Return Value
An object of type `dataframe` having titles, links and short abstracts of the research papers matching `user_query`


### Problems and Errors

`> library(rgscholar)`
`Error in library(rgscholar) : there is no package called ‘rgscholar’`

The above error is because the name of the package is `RgScholar` (R and S are in uppercase)

##Copyright
>
>The MIT License (MIT)
>
>Copyright (c) 2015 Akshay Nagpal (https://twitter.com/akshay2626)
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.



