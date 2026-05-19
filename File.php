<?php
// fix_permissions.php - يعمل من أي مجلد ويصلح الموقع كاملاً

function fixPermissions($path) {
    if (!is_readable($path)) {
        echo "Cannot read path: $path<br>";
        return;
    }

    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::SKIP_DOTS),
        RecursiveIteratorIterator::SELF_FIRST
    );

    $count = 0;
    foreach ($iterator as $item) {
        if ($item->isDir()) {
            if (chmod($item->getPathname(), 0755)) {
                echo "📁 " . $item->getPathname() . " -> 755<br>";
                $count++;
            }
        } else {
            if (chmod($item->getPathname(), 0644)) {
                echo "📄 " . $item->getPathname() . " -> 644<br>";
                $count++;
            }
        }
    }
    echo "<hr><strong>✅ Fixed $count items!</strong>";
}

// محاولة العثور على جذر ووردبريس تلقائياً
$rootPath = __DIR__;

// إذا كنا داخل wp-content، نرجع خطوة للخلف
if (basename($rootPath) == 'wp-content') {
    $rootPath = dirname($rootPath);
}

echo "<h2>🔧 Fixing WordPress Permissions</h2>";
echo "<p>Working on: $rootPath</p>";
echo "<hr>";

fixPermissions($rootPath);
?>
