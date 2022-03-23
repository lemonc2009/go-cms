package util

// PageData ...
type PageData struct {
	Page Page        `json:"page"`
	List interface{} `json:"list"`
}

// Page ...
type Page struct {
	PageNo     int   `json:"page_no"`
	PageSize   int   `json:"page_size"`
	TotalPage  int   `json:"tatal_page"`
	TotalCount int   `json:"tatal_count"`
	IsFirstPage  bool  `json:"is_first_page"`
	IsLastPage   bool  `json:"is_last_page"`
}

// PageUtil ...
func PageUtil(count int64, pageNo int, pageSize int, list interface{}) PageData {

	if pageNo <= 0 {
		pageNo = 1
	}

	tp := count / int64(pageSize)
	if count%int64(pageSize) > 0 {
		tp = count/int64(pageSize) + 1
	}

	page := Page{
		PageNo:       pageNo,
		PageSize:     pageSize,
		TotalPage:    int(tp),
		TotalCount:   int(count),
		IsFirstPage:  pageNo == 1,
		IsLastPage:   pageNo == int(tp),
	}

	return PageData{Page: page, List: list}
}

func Pages(count int64, pageNo int, pageSize int) Page {

	if pageNo <= 0 {
		pageNo = 1
	}

	tp := count / int64(pageSize)
	if count%int64(pageSize) > 0 {
		tp = count/int64(pageSize) + 1
	}

	page := Page{
		PageNo:       pageNo,
		PageSize:     pageSize,
		TotalPage:    int(tp),
		TotalCount:   int(count),
		IsFirstPage:  pageNo == 1,
		IsLastPage:   pageNo == int(tp),
	}

	return page
}