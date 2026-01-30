import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // Common
          'appearance': 'Appearance',
          'dark': 'Dark',
          'light': 'Light',
          'language': 'Language',
          'arabic': 'Arabic',
          'english': 'English',
          'trash': 'Trash',
          'about_app': 'About App',
          'users': 'Users',

          // Screens (examples, extend as needed)
          'onboarding': 'Onboarding',
          'login': 'Login',
          'home': 'Home',

          // Actions
          'continue': 'Continue',
          'save': 'Save',
          'update': 'Update',

          // Auth
          'login_title': 'Sign In',
          'email': 'Email',
          'enter_email': 'Enter your email',
          'password': 'Password',
          'enter_password': 'Enter your password',
          'forgot_password': 'Forgot password?',
          'logging_in': 'Logging in...',
          'required_field': 'This field is required',
          'invalid_email': 'Invalid email address',
          'short_password': 'Password is too short',

          // Home - Common
          'all': 'All',
          'no_orders': 'No orders',
          'no_customers': 'No customers',
          'no_categories': 'No categories',
          'unknown': 'Unknown',
          'name': 'Name',
          'category': 'Category',
          'quantity': 'Quantity',
          'paid': 'Paid',
          'remaining': 'Remaining',
          'note': 'Note',

          // Sections
          'orders_section': 'Orders',
          'customers_section': 'Customers',
          'categories_section': 'Categories',

          // Orders sheet
          'edit_order': 'Edit Order',
          'add_order': 'Add Order',
          'category_type': 'Category type',
          'customer_name': 'Customer name',
          'orders_count': 'Orders count',
          'order_date': 'Order date',
          'amount_paid': 'Amount paid',
          'amount_remaining': 'Amount remaining',

          // Customers sheet
          'add_customer': 'Add Customer',
          'edit_customer': 'Edit Customer',
          'phone_number': 'Phone number',
          'address': 'Address',

          // Categories sheet
          'add_category': 'Add Category',
          'edit_category': 'Edit Category',
          'category': 'Category',
          'price': 'Price',

          // Bottom tabs
          'tabs_categories': 'Categories',
          'tabs_product_details': 'Orders',
          'tabs_customers': 'Customers',
          'tabs_settings': 'Settings',

          // Validators (public textfield)
          'validator_text_only': 'Please enter text only',
          'validator_integer_only': 'Please enter a valid integer',
          'validator_decimal_only': 'Please enter a valid decimal number',
          'validator_phone_invalid': 'Invalid phone number',

          // About screen
          'about_title': 'About App',
          'app_name': 'Smart Distributor',
          'version': 'Version 1.0.0',
          'about_platform': 'About the platform',
          'platform_desc':
              'An integrated solution for managing distribution operations, connects you with your customers accurately, tracks your revenues in real time, and gives you full control over routes in every area.',
          'our_vision': 'Our Vision',
          'vision_desc':
              'Empowering distributors to organize their data and reduce financial waste through smart geographic and financial tracking.',
          'contact_us': 'Contact Us',
          'whatsapp': 'WhatsApp',
          'email': 'Email',
          'github': 'GitHub',
          'alert': 'Alert',
          'whatsapp_open_failed': 'Could not open WhatsApp, please ensure it is installed',
          'error': 'Error',
          'unexpected_error': 'An unexpected error occurred',

          // Users management
          'users_management': 'Users Management',
          'no_users': 'No users',
          'role': 'Role',
          'confirm_delete': 'Confirm delete',
          'confirm_delete_user': 'Are you sure you want to delete this user?',
          'delete': 'Delete',
          'cancel': 'Cancel',
          'add_user': 'Add User',
          'edit_user': 'Edit User',
          'user': 'User',
          'admin': 'Admin',
        },
        'ar': {
          // Common
          'appearance': 'المظهر',
          'dark': 'ليلي',
          'light': 'نهار',
          'language': 'اللغة',
          'arabic': 'عربي',
          'english': 'إنجليزي',
          'trash': 'سلة المحذوفات',
          'about_app': 'حول التطبيق',
          'users': 'المستخدمين',

          // Screens (examples)
          'onboarding': 'شاشة البداية',
          'login': 'تسجيل الدخول',
          'home': 'الرئيسية',

          // Actions
          'continue': 'استمرار',
          'save': 'حفظ',
          'update': 'تحديث',

          // Auth
          'login_title': 'تسجيل دخول',
          'email': 'البريد الإلكتروني',
          'enter_email': 'ادخل البريد الإلكتروني',
          'password': 'كلمة المرور',
          'enter_password': 'ادخل كلمة المرور',
          'forgot_password': 'نسيت كلمة السر؟',
          'logging_in': 'جارٍ الدخول...',
          'required_field': 'الحقل مطلوب',
          'invalid_email': 'بريد إلكتروني غير صالح',
          'short_password': 'كلمة المرور قصيرة',

          // Home - Common
          'all': 'الكل',
          'no_orders': 'لا توجد طلبات',
          'no_customers': 'لا يوجد عملاء',
          'no_categories': 'لا توجد أصناف',
          'unknown': 'غير معروف',
          'name': 'الاسم',
          'category': 'الصنف',
          'quantity': 'الكمية',
          'paid': 'المدفوع',
          'remaining': 'المتبقي',
          'note': 'ملاحظة',

          // Sections
          'orders_section': 'قسم الطلبات',
          'customers_section': 'قسم العملاء',
          'categories_section': 'قسم الأصناف',

          // Orders sheet
          'edit_order': 'تعديل طلب',
          'add_order': 'إضافة طلب',
          'category_type': 'نوع الصنف',
          'customer_name': 'اسم العميل',
          'orders_count': 'عدد الطلبات',
          'order_date': 'تاريخ الطلب',
          'amount_paid': 'المبلغ المدفوع',
          'amount_remaining': 'المبلغ المتبقي',

          // Customers sheet
          'add_customer': 'إضافة عميل',
          'edit_customer': 'تعديل العميل',
          'phone_number': 'رقم الهاتف',
          'address': 'العنوان',

          // Categories sheet
          'add_category': 'إضافة صنف',
          'edit_category': 'تعديل صنف',
          'category': 'الصنف',
          'price': 'السعر',

          // Bottom tabs
          'tabs_categories': 'الأصناف',
          'tabs_product_details': 'الطلبات',
          'tabs_customers': 'العملاء',
          'tabs_settings': 'الإعدادات',

          // Validators (public textfield)
          'validator_text_only': 'يرجى إدخال نص فقط',
          'validator_integer_only': 'يرجى إدخال رقم صحيح فقط',
          'validator_decimal_only': 'يرجى إدخال رقم عشري صحيح',
          'validator_phone_invalid': 'رقم الهاتف غير صحيح',

          // About screen
          'about_title': 'حول التطبيق',
          'app_name': 'موزع الذكي',
          'version': 'الإصدار 1.0.0',
          'about_platform': 'عن المنصة',
          'platform_desc':
              'الحل المتكامل لإدارة عمليات التوزيع، يربطك بعملائك بدقة، يتابع إيراداتك لحظة بلحظة، ويمنحك السيطرة الكاملة على خطوط السير في كل منطقة.',
          'our_vision': 'رؤيتنا',
          'vision_desc':
              'تمكين الموزعين من تنظيم بياناتهم وتقليل الهدر المالي من خلال نظام تتبع جغرافي ومالي ذكي.',
          'contact_us': 'تواصل معنا',
          'whatsapp': 'واتساب',
          'email': 'الإيميل',
          'github': 'جيت هب',
          'alert': 'تنبيه',
          'whatsapp_open_failed': 'تعذر فتح واتساب، تأكد من تثبيت التطبيق',
          'error': 'خطأ',
          'unexpected_error': 'حدث خطأ غير متوقع',

          // Users management
          'users_management': 'إدارة المستخدمين',
          'no_users': 'لا يوجد مستخدمون',
          'role': 'الصلاحية',
          'confirm_delete': 'تأكيد الحذف',
          'confirm_delete_user': 'هل أنت متأكد من حذف هذا المستخدم؟',
          'delete': 'حذف',
          'cancel': 'إلغاء',
          'add_user': 'إضافة مستخدم',
          'edit_user': 'تعديل مستخدم',
          'user': 'مستخدم',
          'admin': 'مشرف',
        },
      };
}
