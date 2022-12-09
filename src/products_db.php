<?php

$mysqli = new mysqli("db", "guanafarma", "guanafarma", "guanafarma") or die(mysqli_error($mysqli));

if (isset($_GET['productSearch']) && $_GET['productSearch'] != "") {
    echo "Search results for: " . $_GET['productSearch'];

    $search = $_GET['productSearch'];
    $sql = "SELECT * FROM products WHERE name LIKE '%$search%' OR description LIKE '%$search%';";
} else {
    $sql = "SELECT * FROM products;";
}

if ($result = $mysqli->query($sql)) {
    while ($data = $result->fetch_object()) {
        $products[] = $data;
    }
}

if (!empty($products)) {
    foreach ($products as $product) {
        echo "<tr>";
        echo "<td class=\"u-border-1 u-border-grey-30 u-border-no-left u-border-no-right u-table-cell\">$product->name</td>";
        echo "<td class=\"u-border-1 u-border-grey-30 u-border-no-left u-border-no-right u-table-cell\">$product->description</td >";
        echo "<td class=\"u-border-1 u-border-grey-30 u-border-no-left u-border-no-right u-table-cell\"> &#x20a1; $product->price </td >";
        echo "<td class=\"u-border-1 u-border-grey-30 u-border-no-left u-border-no-right u-table-cell\"> <img alt='$product->name' src=\"images/products/$product->image\" style='max-width: 150px'> </td >";
        echo "</tr >";
    }
} else {
    echo "No products found";
}