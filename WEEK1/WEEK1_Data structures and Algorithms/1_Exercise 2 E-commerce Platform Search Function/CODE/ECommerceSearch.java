public class ECommerceSearch {

    // Product class with attributes
    static class Product {
        int productId;
        String productName;
        String category;

        public Product(int productId, String productName, String category) {
            this.productId = productId;
            this.productName = productName;
            this.category = category;
        }
    }

    // Linear Search method
    public static int linearSearch(Product[] products, int targetId) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].productId == targetId) {
                return i;
            }
        }
        return -1;
    }

    // Binary Search method (array should be sorted by productId)
    public static int binarySearch(Product[] products, int targetId) {
        int left = 0, right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (products[mid].productId == targetId) {
                return mid;
            } else if (products[mid].productId < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return -1;
    }

    // Main Method to execute and test
    public static void main(String[] args) {
        // Create product list
        Product[] products = {
            new Product(103, "Laptop", "Electronics"),
            new Product(101, "Mobile", "Electronics"),
            new Product(104, "Shoes", "Footwear"),
            new Product(102, "Watch", "Accessories"),
            new Product(105, "Book", "Stationary")
        };

        // Sort products for binary search (sort by productId)
        java.util.Arrays.sort(products, (a, b) -> a.productId - b.productId);

        // Linear Search test
        int targetId = 104;
        int linearIndex = linearSearch(products, targetId);
        if (linearIndex != -1) {
            System.out.println("Linear Search: Product Found -> " 
                + products[linearIndex].productName + " (" + products[linearIndex].category + ")");
        } else {
            System.out.println("Linear Search: Product not found");
        }

        // Binary Search test
        int binaryIndex = binarySearch(products, targetId);
        if (binaryIndex != -1) {
            System.out.println("Binary Search: Product Found -> " 
                + products[binaryIndex].productName + " (" + products[binaryIndex].category + ")");
        } else {
            System.out.println("Binary Search: Product not found");
        }
    }
}

