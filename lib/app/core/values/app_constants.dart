// App Level Constants

const kAppTitle = 'FleetCare ELD'; // App Title

// Browser Window Title
const kBrowserWindowTitle = kAppTitle;

// Responsiveness: Widths and breakpoints
// Desktop: Above 1200px screen width
// Tablet: 800px - 1200px screen width
// Mobile: 200px - 800px screen width (default)
// Watch: less than 200px screen width (not supported in this app)
const kDesktopWidth = 1200.0;
const kTabletWidth = 800.0;
const kMobileWidth = 200.0;

const double kDesktopContentWidth = 1200;
const double kTabletContentWidth = 800;
const double kMobileContentWidth = 640;

// Padding
const kZeroPadding = 0.0; // zero padding
const kHorizontalPaddingDesktop = 40.0; // left and right padding for tablet
const kHorizontalPaddingTablet = 24.0; // left and right padding for tablet
const kHorizontalPaddingMobile = 16.0; // left and right padding for mobile

// Desktop
const kMinDesktopContentWidth = 1200.0; // initial content width for desktop
const kMaxDesktopContentWidth = 1360.0; // maximum content width for desktop

// Minimum display height
const kMinDisplayHeight = 200.0; // minimum display height

// App
const double kFormFieldWidthDesktop = 274;
const double kFormFieldWidthTablet = 240;

// Footer
const double kFooterSingleLineHeight = 36;
const double kFooterDoubleLineHeight = 90;
const double kFooterMultiLineHeight = 130;
const double kFooterSingleLineBreakpoint = 1240.0;
const double kFooterDoubleLineBreakpoint = 600.0;

const double kMarkDownContentWidth = 800;
//App Navigation Drawer
const double kLeftMenuExpandedWidth = 240;
const double kLeftMenuCollapsedWidth = 85;

//Tab Bar Width
const double kTabBarWidth = 800;

const double contentWidth = 570; // Fixed typo from containtWidth

// Auth Card Dimensions
const double kAuthCardWidth = 450.0;
const double kAuthCardHeight = 620.0;

const kFormsHintTextEmail = 'username@domain.com';

// Snackbar display
const kSnackBarDisplayDurationSeconds =
    5; // snackbar display duration in seconds

// Related to Dates / Date Pickers
DateTime earliestAllowedDate = DateTime(1900);
DateTime latestAllowedDate = DateTime.now();

// Pagination
const kItemsPerPage = 20; // no of items to be displayed per page
const kSearchHitsPerPage = 20; // no of search hits to be displayed per page
