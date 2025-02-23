; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [128 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [256 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 118
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 51
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 113
	i32 136584136, ; 7: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 8: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 62
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 81
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 95
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 58
	i32 321963286, ; 14: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 69
	i32 347068432, ; 16: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 56
	i32 379916513, ; 17: System.Threading.Thread.dll => 0x16a510e1 => 118
	i32 385762202, ; 18: System.Memory.dll => 0x16fe439a => 103
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 20: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 92
	i32 450948140, ; 22: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 68
	i32 456227837, ; 23: System.Web.HttpUtility.dll => 0x1b317bfd => 120
	i32 469710990, ; 24: System.dll => 0x1bff388e => 122
	i32 489220957, ; 25: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 26: System.ObjectModel => 0x1dbae811 => 109
	i32 513247710, ; 27: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 45
	i32 538707440, ; 28: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 29: Microsoft.Extensions.Logging => 0x20216150 => 42
	i32 597488923, ; 30: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 31: Xamarin.AndroidX.CustomView => 0x2568904f => 66
	i32 627931235, ; 32: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 33: System.Collections.Concurrent => 0x2814a96c => 89
	i32 722857257, ; 34: System.Runtime.Loader.dll => 0x2b15ed29 => 114
	i32 748832960, ; 35: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 54
	i32 759454413, ; 36: System.Net.Requests => 0x2d445acd => 107
	i32 775507847, ; 37: System.IO.Compression => 0x2e394f87 => 100
	i32 777317022, ; 38: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 39: Microsoft.Extensions.Options => 0x2f0980eb => 44
	i32 823281589, ; 40: System.Private.Uri.dll => 0x311247b5 => 110
	i32 830298997, ; 41: System.IO.Compression.Brotli => 0x317d5b75 => 99
	i32 869139383, ; 42: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 43: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 44: System.ComponentModel.Primitives.dll => 0x35e25008 => 93
	i32 918734561, ; 45: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 46: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 966729478, ; 47: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 85
	i32 967690846, ; 48: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 69
	i32 990727110, ; 49: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 50: System.Collections.dll => 0x3b2c715c => 92
	i32 1012816738, ; 51: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 79
	i32 1028951442, ; 52: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 41
	i32 1035644815, ; 53: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 59
	i32 1043950537, ; 54: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 55: System.Linq.Expressions.dll => 0x3e444eb4 => 101
	i32 1052210849, ; 56: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 71
	i32 1082857460, ; 57: System.ComponentModel.TypeConverter => 0x408b17f4 => 94
	i32 1084122840, ; 58: Xamarin.Kotlin.StdLib => 0x409e66d8 => 86
	i32 1098259244, ; 59: System => 0x41761b2c => 122
	i32 1108272742, ; 60: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 61: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 62: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 63: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 64: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 76
	i32 1214827643, ; 65: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1260983243, ; 66: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1262844159, ; 67: uniunity5 => 0x4b4578ff => 88
	i32 1292207520, ; 68: SQLitePCLRaw.core.dll => 0x4d0585a0 => 55
	i32 1293217323, ; 69: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 67
	i32 1308624726, ; 70: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 71: System.Linq => 0x4eed2679 => 102
	i32 1336711579, ; 72: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 73: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 74: Xamarin.AndroidX.SavedState => 0x52114ed3 => 79
	i32 1406073936, ; 75: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 63
	i32 1430672901, ; 76: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1435222561, ; 77: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 85
	i32 1461004990, ; 78: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 79: System.Collections.Immutable.dll => 0x5718a9ef => 90
	i32 1462112819, ; 80: System.IO.Compression.dll => 0x57261233 => 100
	i32 1469204771, ; 81: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 60
	i32 1470490898, ; 82: Microsoft.Extensions.Primitives => 0x57a5e912 => 45
	i32 1479771757, ; 83: System.Collections.Immutable => 0x5833866d => 90
	i32 1480492111, ; 84: System.IO.Compression.Brotli.dll => 0x583e844f => 99
	i32 1526286932, ; 85: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 86: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 117
	i32 1622152042, ; 87: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 73
	i32 1624863272, ; 88: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 83
	i32 1634654947, ; 89: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 90: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 65
	i32 1639515021, ; 91: System.Net.Http.dll => 0x61b9038d => 104
	i32 1639986890, ; 92: System.Text.RegularExpressions => 0x61c036ca => 117
	i32 1657153582, ; 93: System.Runtime => 0x62c6282e => 115
	i32 1658251792, ; 94: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 84
	i32 1677501392, ; 95: System.Net.Primitives.dll => 0x63fca3d0 => 106
	i32 1679769178, ; 96: System.Security.Cryptography => 0x641f3e5a => 116
	i32 1711441057, ; 97: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 56
	i32 1729485958, ; 98: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 61
	i32 1743415430, ; 99: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 100: System.Diagnostics.TraceSource.dll => 0x69239124 => 98
	i32 1766324549, ; 101: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 81
	i32 1770582343, ; 102: Microsoft.Extensions.Logging.dll => 0x6988f147 => 42
	i32 1780572499, ; 103: Mono.Android.Runtime.dll => 0x6a216153 => 126
	i32 1782862114, ; 104: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 105: Xamarin.AndroidX.Fragment => 0x6a96652d => 68
	i32 1793755602, ; 106: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 107: Xamarin.AndroidX.Loader => 0x6bcd3296 => 73
	i32 1813058853, ; 108: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 86
	i32 1813201214, ; 109: Xamarin.Google.Android.Material => 0x6c13413e => 84
	i32 1818569960, ; 110: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 77
	i32 1828688058, ; 111: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 43
	i32 1853025655, ; 112: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 113: System.Linq.Expressions => 0x6ec71a65 => 101
	i32 1875935024, ; 114: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 115: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 116: System.Collections.NonGeneric.dll => 0x71dc7c8b => 91
	i32 1953182387, ; 117: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1961813231, ; 118: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 80
	i32 1968388702, ; 119: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 38
	i32 1977389929, ; 120: uniunity5.dll => 0x75dc9369 => 88
	i32 2003115576, ; 121: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 122: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 71
	i32 2045470958, ; 123: System.Private.Xml => 0x79eb68ee => 111
	i32 2055257422, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 70
	i32 2066184531, ; 125: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 126: System.Diagnostics.TraceSource => 0x7b6f419e => 98
	i32 2079903147, ; 127: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 128: System.Numerics.Vectors => 0x7c9bf920 => 108
	i32 2103459038, ; 129: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 57
	i32 2127167465, ; 130: System.Console => 0x7ec9ffe9 => 96
	i32 2159891885, ; 131: Microsoft.Maui => 0x80bd55ad => 49
	i32 2169148018, ; 132: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 133: Microsoft.Extensions.Options.dll => 0x820d22b3 => 44
	i32 2192057212, ; 134: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 43
	i32 2193016926, ; 135: System.ObjectModel.dll => 0x82b6c85e => 109
	i32 2201107256, ; 136: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 87
	i32 2201231467, ; 137: System.Net.Http => 0x8334206b => 104
	i32 2207618523, ; 138: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 139: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 39
	i32 2279755925, ; 140: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 78
	i32 2298471582, ; 141: System.Net.Mail => 0x88ffe49e => 105
	i32 2303942373, ; 142: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 143: System.Private.CoreLib.dll => 0x896b7878 => 124
	i32 2340441535, ; 144: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 112
	i32 2353062107, ; 145: System.Net.Primitives => 0x8c40e0db => 106
	i32 2366048013, ; 146: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 147: System.Xml.ReaderWriter.dll => 0x8d24e767 => 121
	i32 2371007202, ; 148: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 38
	i32 2395872292, ; 149: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 150: System.Web.HttpUtility => 0x8f24faee => 120
	i32 2427813419, ; 151: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 152: System.Console.dll => 0x912896e5 => 96
	i32 2465273461, ; 153: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 54
	i32 2471841756, ; 154: netstandard.dll => 0x93554fdc => 123
	i32 2475788418, ; 155: Java.Interop.dll => 0x93918882 => 125
	i32 2480646305, ; 156: Microsoft.Maui.Controls => 0x93dba8a1 => 47
	i32 2503351294, ; 157: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 158: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2576534780, ; 159: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 160: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 161: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 87
	i32 2617129537, ; 162: System.Private.Xml.dll => 0x9bfe3a41 => 111
	i32 2620871830, ; 163: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 65
	i32 2626831493, ; 164: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 165: System.Runtime.Loader => 0x9ec4cf01 => 114
	i32 2732626843, ; 166: Xamarin.AndroidX.Activity => 0xa2e0939b => 58
	i32 2737747696, ; 167: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 60
	i32 2740698338, ; 168: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 169: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 170: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 48
	i32 2764765095, ; 171: Microsoft.Maui.dll => 0xa4caf7a7 => 49
	i32 2778768386, ; 172: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 82
	i32 2785988530, ; 173: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 174: Microsoft.Maui.Graphics => 0xa7008e0b => 51
	i32 2810250172, ; 175: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 63
	i32 2853208004, ; 176: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 82
	i32 2861189240, ; 177: Microsoft.Maui.Essentials => 0xaa8a4878 => 50
	i32 2868488919, ; 178: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 179: System.Private.CoreLib => 0xad6f1e8a => 124
	i32 2916838712, ; 180: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 83
	i32 2919462931, ; 181: System.Numerics.Vectors.dll => 0xae037813 => 108
	i32 2959614098, ; 182: System.ComponentModel.dll => 0xb0682092 => 95
	i32 2978675010, ; 183: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 67
	i32 2987532451, ; 184: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 80
	i32 3038032645, ; 185: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 186: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 187: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 74
	i32 3059408633, ; 188: Mono.Android.Runtime => 0xb65adef9 => 126
	i32 3059793426, ; 189: System.ComponentModel.Primitives => 0xb660be12 => 93
	i32 3135354210, ; 190: Plugin.Maui.Calendar => 0xbae1b562 => 52
	i32 3178803400, ; 191: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 75
	i32 3220365878, ; 192: System.Threading => 0xbff2e236 => 119
	i32 3258312781, ; 193: Xamarin.AndroidX.CardView => 0xc235e84d => 61
	i32 3286872994, ; 194: SQLite-net.dll => 0xc3e9b3a2 => 53
	i32 3305363605, ; 195: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 196: System.Net.Requests.dll => 0xc5b097e4 => 107
	i32 3317135071, ; 197: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 66
	i32 3346324047, ; 198: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 76
	i32 3357674450, ; 199: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3360279109, ; 200: SQLitePCLRaw.core => 0xc849ca45 => 55
	i32 3362522851, ; 201: Xamarin.AndroidX.Core => 0xc86c06e3 => 64
	i32 3366347497, ; 202: Java.Interop => 0xc8a662e9 => 125
	i32 3374999561, ; 203: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 78
	i32 3381016424, ; 204: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 205: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 40
	i32 3430777524, ; 206: netstandard => 0xcc7d82b4 => 123
	i32 3452344032, ; 207: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 46
	i32 3458724246, ; 208: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 209: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 94
	i32 3476120550, ; 210: Mono.Android => 0xcf3163e6 => 127
	i32 3484440000, ; 211: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 212: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 213: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 214: System.Linq.dll => 0xd715a361 => 102
	i32 3624195450, ; 215: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 112
	i32 3641597786, ; 216: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 70
	i32 3643446276, ; 217: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 218: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 75
	i32 3657292374, ; 219: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 39
	i32 3672681054, ; 220: Mono.Android.dll => 0xdae8aa5e => 127
	i32 3696332803, ; 221: Plugin.Maui.Calendar.dll => 0xdc519003 => 52
	i32 3724971120, ; 222: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 74
	i32 3748608112, ; 223: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 97
	i32 3751619990, ; 224: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3754567612, ; 225: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 57
	i32 3786282454, ; 226: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 62
	i32 3792276235, ; 227: System.Collections.NonGeneric => 0xe2098b0b => 91
	i32 3800979733, ; 228: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 46
	i32 3817368567, ; 229: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 230: System.Security.Cryptography.dll => 0xe3df9d2b => 116
	i32 3841636137, ; 231: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 41
	i32 3844307129, ; 232: System.Net.Mail.dll => 0xe52378b9 => 105
	i32 3849253459, ; 233: System.Runtime.InteropServices.dll => 0xe56ef253 => 113
	i32 3876362041, ; 234: SQLite-net => 0xe70c9739 => 53
	i32 3896106733, ; 235: System.Collections.Concurrent.dll => 0xe839deed => 89
	i32 3896760992, ; 236: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 64
	i32 3920221145, ; 237: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 238: System.Xml.ReaderWriter => 0xea213423 => 121
	i32 3931092270, ; 239: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 77
	i32 3955647286, ; 240: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 59
	i32 4025784931, ; 241: System.Memory => 0xeff49a63 => 103
	i32 4046471985, ; 242: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 48
	i32 4073602200, ; 243: System.Threading.dll => 0xf2ce3c98 => 119
	i32 4091086043, ; 244: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 245: Microsoft.Maui.Essentials.dll => 0xf40add04 => 50
	i32 4100113165, ; 246: System.Private.Uri => 0xf462c30d => 110
	i32 4103439459, ; 247: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 248: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 40
	i32 4150914736, ; 249: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 250: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 72
	i32 4213026141, ; 251: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 97
	i32 4249188766, ; 252: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 253: Microsoft.Maui.Controls.dll => 0xfea12dee => 47
	i32 4274623895, ; 254: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4292120959 ; 255: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 72
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [256 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 118, ; 2
	i32 33, ; 3
	i32 51, ; 4
	i32 17, ; 5
	i32 113, ; 6
	i32 32, ; 7
	i32 25, ; 8
	i32 62, ; 9
	i32 81, ; 10
	i32 95, ; 11
	i32 30, ; 12
	i32 58, ; 13
	i32 8, ; 14
	i32 69, ; 15
	i32 56, ; 16
	i32 118, ; 17
	i32 103, ; 18
	i32 34, ; 19
	i32 28, ; 20
	i32 92, ; 21
	i32 68, ; 22
	i32 120, ; 23
	i32 122, ; 24
	i32 6, ; 25
	i32 109, ; 26
	i32 45, ; 27
	i32 27, ; 28
	i32 42, ; 29
	i32 35, ; 30
	i32 66, ; 31
	i32 19, ; 32
	i32 89, ; 33
	i32 114, ; 34
	i32 54, ; 35
	i32 107, ; 36
	i32 100, ; 37
	i32 25, ; 38
	i32 44, ; 39
	i32 110, ; 40
	i32 99, ; 41
	i32 10, ; 42
	i32 24, ; 43
	i32 93, ; 44
	i32 21, ; 45
	i32 14, ; 46
	i32 85, ; 47
	i32 69, ; 48
	i32 23, ; 49
	i32 92, ; 50
	i32 79, ; 51
	i32 41, ; 52
	i32 59, ; 53
	i32 4, ; 54
	i32 101, ; 55
	i32 71, ; 56
	i32 94, ; 57
	i32 86, ; 58
	i32 122, ; 59
	i32 26, ; 60
	i32 20, ; 61
	i32 16, ; 62
	i32 22, ; 63
	i32 76, ; 64
	i32 37, ; 65
	i32 2, ; 66
	i32 88, ; 67
	i32 55, ; 68
	i32 67, ; 69
	i32 11, ; 70
	i32 102, ; 71
	i32 31, ; 72
	i32 32, ; 73
	i32 79, ; 74
	i32 63, ; 75
	i32 0, ; 76
	i32 85, ; 77
	i32 6, ; 78
	i32 90, ; 79
	i32 100, ; 80
	i32 60, ; 81
	i32 45, ; 82
	i32 90, ; 83
	i32 99, ; 84
	i32 30, ; 85
	i32 117, ; 86
	i32 73, ; 87
	i32 83, ; 88
	i32 36, ; 89
	i32 65, ; 90
	i32 104, ; 91
	i32 117, ; 92
	i32 115, ; 93
	i32 84, ; 94
	i32 106, ; 95
	i32 116, ; 96
	i32 56, ; 97
	i32 61, ; 98
	i32 1, ; 99
	i32 98, ; 100
	i32 81, ; 101
	i32 42, ; 102
	i32 126, ; 103
	i32 17, ; 104
	i32 68, ; 105
	i32 9, ; 106
	i32 73, ; 107
	i32 86, ; 108
	i32 84, ; 109
	i32 77, ; 110
	i32 43, ; 111
	i32 26, ; 112
	i32 101, ; 113
	i32 8, ; 114
	i32 2, ; 115
	i32 91, ; 116
	i32 13, ; 117
	i32 80, ; 118
	i32 38, ; 119
	i32 88, ; 120
	i32 5, ; 121
	i32 71, ; 122
	i32 111, ; 123
	i32 70, ; 124
	i32 4, ; 125
	i32 98, ; 126
	i32 115, ; 127
	i32 108, ; 128
	i32 57, ; 129
	i32 96, ; 130
	i32 49, ; 131
	i32 12, ; 132
	i32 44, ; 133
	i32 43, ; 134
	i32 109, ; 135
	i32 87, ; 136
	i32 104, ; 137
	i32 14, ; 138
	i32 39, ; 139
	i32 78, ; 140
	i32 105, ; 141
	i32 18, ; 142
	i32 124, ; 143
	i32 112, ; 144
	i32 106, ; 145
	i32 12, ; 146
	i32 121, ; 147
	i32 38, ; 148
	i32 13, ; 149
	i32 120, ; 150
	i32 10, ; 151
	i32 96, ; 152
	i32 54, ; 153
	i32 123, ; 154
	i32 125, ; 155
	i32 47, ; 156
	i32 16, ; 157
	i32 11, ; 158
	i32 15, ; 159
	i32 20, ; 160
	i32 87, ; 161
	i32 111, ; 162
	i32 65, ; 163
	i32 15, ; 164
	i32 114, ; 165
	i32 58, ; 166
	i32 60, ; 167
	i32 1, ; 168
	i32 21, ; 169
	i32 48, ; 170
	i32 49, ; 171
	i32 82, ; 172
	i32 27, ; 173
	i32 51, ; 174
	i32 63, ; 175
	i32 82, ; 176
	i32 50, ; 177
	i32 36, ; 178
	i32 124, ; 179
	i32 83, ; 180
	i32 108, ; 181
	i32 95, ; 182
	i32 67, ; 183
	i32 80, ; 184
	i32 34, ; 185
	i32 7, ; 186
	i32 74, ; 187
	i32 126, ; 188
	i32 93, ; 189
	i32 52, ; 190
	i32 75, ; 191
	i32 119, ; 192
	i32 61, ; 193
	i32 53, ; 194
	i32 7, ; 195
	i32 107, ; 196
	i32 66, ; 197
	i32 76, ; 198
	i32 24, ; 199
	i32 55, ; 200
	i32 64, ; 201
	i32 125, ; 202
	i32 78, ; 203
	i32 3, ; 204
	i32 40, ; 205
	i32 123, ; 206
	i32 46, ; 207
	i32 22, ; 208
	i32 94, ; 209
	i32 127, ; 210
	i32 23, ; 211
	i32 31, ; 212
	i32 33, ; 213
	i32 102, ; 214
	i32 112, ; 215
	i32 70, ; 216
	i32 28, ; 217
	i32 75, ; 218
	i32 39, ; 219
	i32 127, ; 220
	i32 52, ; 221
	i32 74, ; 222
	i32 97, ; 223
	i32 3, ; 224
	i32 57, ; 225
	i32 62, ; 226
	i32 91, ; 227
	i32 46, ; 228
	i32 35, ; 229
	i32 116, ; 230
	i32 41, ; 231
	i32 105, ; 232
	i32 113, ; 233
	i32 53, ; 234
	i32 89, ; 235
	i32 64, ; 236
	i32 19, ; 237
	i32 121, ; 238
	i32 77, ; 239
	i32 59, ; 240
	i32 103, ; 241
	i32 48, ; 242
	i32 119, ; 243
	i32 5, ; 244
	i32 50, ; 245
	i32 110, ; 246
	i32 29, ; 247
	i32 40, ; 248
	i32 29, ; 249
	i32 72, ; 250
	i32 97, ; 251
	i32 18, ; 252
	i32 47, ; 253
	i32 37, ; 254
	i32 72 ; 255
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
