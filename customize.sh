#模块内容全部进magisk系统=0
#更多自定义=1
SKIPUNZIP=0

sdk_verison=$(getprop ro.build.version.sdk)
product_code=$(getprop ro.build.product)
min_sdk=31

check_product () {
    product_list="XQ-AT42 XQ-AT51 XQ-AT52 XQ-AT72 XQ-AS42 XQ-AS52 XQ-AS62 XQ-AS72 XQ-AU42 XQ-AU51 XQ-AU52 XQ-BE42 XQ-BE52 XQ-BE62 XQ-BE72 XQ-BC42 XQ-BC52 XQ-BC62 XQ-BC72 XQ-BQ42 XQ-BQ52 XQ-BQ62 XQ-BQ72 XQ-BT44 XQ-BT52"
    for product in $product_list; do
        if [ "$product_code" == "$product" ]; then
            return 1
        fi
    done
    return 0
}

ui_print "- SDK version: $sdk_verison"
if [ $sdk_verison -lt $min_sdk ]; then
    abort "Only for Android 12+ (SDK 31+)"
fi

ui_print "- Product code: $product_code"
if check_product; then
    abort "Only for Xperia 1II/5II/10II/1III/5III/10III/PRO-I"
fi
