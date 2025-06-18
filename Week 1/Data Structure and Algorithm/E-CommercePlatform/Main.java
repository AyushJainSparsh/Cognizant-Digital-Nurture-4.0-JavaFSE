public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(102, "Shoes", "Footwear"),
            new Product(104, "Phone", "Electronics"),
            new Product(101, "T-shirt", "Clothing"),
            new Product(103, "Laptop", "Electronics")
        };

        // Linear Search (unsorted)
        Product result1 = SearchAlgorithms.linearSearch(products, 104);
        System.out.println("Linear Search Result: " + (result1 != null ? result1 : "Not Found"));

        // Sort array before Binary Search
        SearchAlgorithms.sortProductsById(products);
        Product result2 = SearchAlgorithms.binarySearch(products, 104);
        System.out.println("Binary Search Result: " + (result2 != null ? result2 : "Not Found"));
    }
}
