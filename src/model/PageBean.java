package model;

public class PageBean<T> {
    private int total;
    private int totalPage;
    private int pageNumber;
    private int pageSize;
    private int startIndex;
    private List<T> products;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getTotalPage() {
        return totalPage = this.total % this.pageSize == 0 ? 
                (this.total / this.pageSize) : (this.total/this.pageSize+1);
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStartIndex() {
        return startIndex = this.pageSize * (this.pageNumber - 1);
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public List<T> getProducts() {
        return products;
    }

    public void setProducts(List<T> products) {
        this.products = products;
    }

    public PageBean() {
    }

}

