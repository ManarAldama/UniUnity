; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [128 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [256 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 45
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 127
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 50
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 101
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 62
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 79
	i64 435118502366263740, ; 6: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 80
	i64 750875890346172408, ; 7: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 118
	i64 799765834175365804, ; 8: System.ComponentModel.dll => 0xb1956c9f18442ac => 95
	i64 805302231655005164, ; 9: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 870603111519317375, ; 10: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 56
	i64 872800313462103108, ; 11: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 67
	i64 1120440138749646132, ; 12: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 84
	i64 1301485588176585670, ; 13: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 55
	i64 1369545283391376210, ; 14: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 75
	i64 1476839205573959279, ; 15: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 106
	i64 1486715745332614827, ; 16: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 47
	i64 1513467482682125403, ; 17: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 126
	i64 1518315023656898250, ; 18: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 57
	i64 1537168428375924959, ; 19: System.Threading.Thread.dll => 0x15551e8a954ae0df => 118
	i64 1624659445732251991, ; 20: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 60
	i64 1628611045998245443, ; 21: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 72
	i64 1735388228521408345, ; 22: System.Net.Mail.dll => 0x181556663c69b759 => 105
	i64 1743969030606105336, ; 23: System.Memory.dll => 0x1833d297e88f2af8 => 103
	i64 1767386781656293639, ; 24: System.Private.Uri.dll => 0x188704e9f5582107 => 110
	i64 1795316252682057001, ; 25: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 59
	i64 1825687700144851180, ; 26: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 112
	i64 1835311033149317475, ; 27: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 28: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 79
	i64 1881198190668717030, ; 29: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 30: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 80
	i64 1920760634179481754, ; 31: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 48
	i64 1930726298510463061, ; 32: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 37
	i64 1981742497975770890, ; 33: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 71
	i64 2262844636196693701, ; 34: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 67
	i64 2287834202362508563, ; 35: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 89
	i64 2329709569556905518, ; 36: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 70
	i64 2470498323731680442, ; 37: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 63
	i64 2497223385847772520, ; 38: System.Runtime => 0x22a7eb7046413568 => 115
	i64 2547086958574651984, ; 39: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 58
	i64 2602673633151553063, ; 40: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 41: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 40
	i64 2662981627730767622, ; 42: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 43: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 44: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 84
	i64 3289520064315143713, ; 45: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 69
	i64 3311221304742556517, ; 46: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 108
	i64 3344514922410554693, ; 47: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 87
	i64 3429672777697402584, ; 48: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 50
	i64 3494946837667399002, ; 49: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 38
	i64 3522470458906976663, ; 50: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 81
	i64 3551103847008531295, ; 51: System.Private.CoreLib.dll => 0x31480e226177735f => 124
	i64 3567343442040498961, ; 52: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 53: System.Runtime.dll => 0x319037675df7e556 => 115
	i64 3638003163729360188, ; 54: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 39
	i64 3647754201059316852, ; 55: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 121
	i64 3655542548057982301, ; 56: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 38
	i64 3716579019761409177, ; 57: netstandard.dll => 0x3393f0ed5c8c5c99 => 123
	i64 3727469159507183293, ; 58: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 78
	i64 3869221888984012293, ; 59: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 42
	i64 3890352374528606784, ; 60: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 48
	i64 3933965368022646939, ; 61: System.Net.Requests => 0x369840a8bfadc09b => 107
	i64 3966267475168208030, ; 62: System.Memory => 0x370b03412596249e => 103
	i64 4070326265757318011, ; 63: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 64: System.Private.Xml.dll => 0x3887fb25779ae26e => 111
	i64 4073631083018132676, ; 65: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 46
	i64 4120493066591692148, ; 66: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 67: System.ComponentModel => 0x39a7562737acb67e => 95
	i64 4187479170553454871, ; 68: System.Linq.Expressions => 0x3a1cea1e912fa117 => 101
	i64 4205801962323029395, ; 69: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 94
	i64 4337444564132831293, ; 70: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 54
	i64 4360412976914417659, ; 71: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4477672992252076438, ; 72: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 120
	i64 4699746907221595172, ; 73: uniunity5.dll => 0x4138dae96b2f1424 => 88
	i64 4794310189461587505, ; 74: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 58
	i64 4795410492532947900, ; 75: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 81
	i64 4853321196694829351, ; 76: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 114
	i64 4871824391508510238, ; 77: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4953714692329509532, ; 78: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5290786973231294105, ; 79: System.Runtime.Loader => 0x496ca6b869b72699 => 114
	i64 5423376490970181369, ; 80: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 112
	i64 5471532531798518949, ; 81: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 82: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 83: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 99
	i64 5573260873512690141, ; 84: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 116
	i64 5692067934154308417, ; 85: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 83
	i64 6183170893902868313, ; 86: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 54
	i64 6200764641006662125, ; 87: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6300676701234028427, ; 88: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6357457916754632952, ; 89: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 90: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 70
	i64 6471714727257221498, ; 91: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 92: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 93: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 66
	i64 6560151584539558821, ; 94: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 44
	i64 6743165466166707109, ; 95: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6786606130239981554, ; 96: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 98
	i64 6893283808111824265, ; 97: Plugin.Maui.Calendar.dll => 0x5fa9dd19ee750d89 => 52
	i64 6894844156784520562, ; 98: System.Numerics.Vectors => 0x5faf683aead1ad72 => 108
	i64 7270811800166795866, ; 99: System.Linq => 0x64e71ccf51a90a5a => 102
	i64 7377312882064240630, ; 100: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 94
	i64 7489048572193775167, ; 101: System.ObjectModel => 0x67ee71ff6b419e3f => 109
	i64 7654504624184590948, ; 102: System.Net.Http => 0x6a3a4366801b8264 => 104
	i64 7694700312542370399, ; 103: System.Net.Mail => 0x6ac9112a7e2cda5f => 105
	i64 7714652370974252055, ; 104: System.Private.CoreLib => 0x6b0ff375198b9c17 => 124
	i64 7735352534559001595, ; 105: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 86
	i64 7742555799473854801, ; 106: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7836164640616011524, ; 107: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 60
	i64 7975724199463739455, ; 108: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8064050204834738623, ; 109: System.Collections.dll => 0x6fe942efa61731bf => 92
	i64 8083354569033831015, ; 110: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 69
	i64 8087206902342787202, ; 111: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 97
	i64 8108129031893776750, ; 112: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 113: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 125
	i64 8185542183669246576, ; 114: System.Collections => 0x7198e33f4794aa70 => 92
	i64 8246048515196606205, ; 115: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 51
	i64 8368701292315763008, ; 116: System.Security.Cryptography => 0x7423997c6fd56140 => 116
	i64 8386351099740279196, ; 117: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 118: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 77
	i64 8518412311883997971, ; 119: System.Collections.Immutable => 0x76377add7c28e313 => 90
	i64 8563666267364444763, ; 120: System.Private.Uri => 0x76d841191140ca5b => 110
	i64 8599632406834268464, ; 121: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8626175481042262068, ; 122: Java.Interop => 0x77b654e585b55834 => 125
	i64 8639588376636138208, ; 123: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 76
	i64 8677882282824630478, ; 124: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 125: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 97
	i64 9045785047181495996, ; 126: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 127: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 83
	i64 9324707631942237306, ; 128: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 59
	i64 9363564275759486853, ; 129: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9551379474083066910, ; 130: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9575902398040817096, ; 131: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 85
	i64 9659729154652888475, ; 132: System.Text.RegularExpressions => 0x860e407c9991dd9b => 117
	i64 9678050649315576968, ; 133: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 63
	i64 9702891218465930390, ; 134: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 91
	i64 9773637193738963987, ; 135: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 136: Mono.Android.dll => 0x881f890734e555e7 => 127
	i64 9956195530459977388, ; 137: Microsoft.Maui => 0x8a2b8315b36616ac => 49
	i64 10038780035334861115, ; 138: System.Net.Http.dll => 0x8b50e941206af13b => 104
	i64 10051358222726253779, ; 139: System.Private.Xml => 0x8b7d990c97ccccd3 => 111
	i64 10092835686693276772, ; 140: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 47
	i64 10143853363526200146, ; 141: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 142: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 143: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 66
	i64 10406448008575299332, ; 144: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 87
	i64 10430153318873392755, ; 145: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 64
	i64 10506226065143327199, ; 146: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10761706286639228993, ; 147: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10785150219063592792, ; 148: System.Net.Primitives => 0x95ac8cfb68830758 => 106
	i64 10880838204485145808, ; 149: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 11002576679268595294, ; 150: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 43
	i64 11009005086950030778, ; 151: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 49
	i64 11103970607964515343, ; 152: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 153: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 154: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 155: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 82
	i64 11220793807500858938, ; 156: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 157: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 44
	i64 11340910727871153756, ; 158: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 65
	i64 11485890710487134646, ; 159: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 113
	i64 11518296021396496455, ; 160: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 161: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 82
	i64 11530571088791430846, ; 162: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 42
	i64 11597940890313164233, ; 163: netstandard => 0xa0f429ca8d1805c9 => 123
	i64 11739066727115742305, ; 164: SQLite-net.dll => 0xa2e98afdf8575c61 => 53
	i64 11806260347154423189, ; 165: SQLite-net => 0xa3d8433bc5eb5d95 => 53
	i64 11855031688536399763, ; 166: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12269460666702402136, ; 167: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 90
	i64 12279246230491828964, ; 168: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 57
	i64 12341818387765915815, ; 169: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 170: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 68
	i64 12466513435562512481, ; 171: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 73
	i64 12475113361194491050, ; 172: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 173: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 98
	i64 12538491095302438457, ; 174: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 61
	i64 12550732019250633519, ; 175: System.IO.Compression => 0xae2d28465e8e1b2f => 100
	i64 12700543734426720211, ; 176: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 62
	i64 12843321153144804894, ; 177: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 45
	i64 12989346753972519995, ; 178: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13005833372463390146, ; 179: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13343850469010654401, ; 180: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 126
	i64 13381594904270902445, ; 181: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 182: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 86
	i64 13540124433173649601, ; 183: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13572454107664307259, ; 184: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 78
	i64 13717397318615465333, ; 185: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 93
	i64 13881769479078963060, ; 186: System.Console.dll => 0xc0a5f3cade5c6774 => 96
	i64 13959074834287824816, ; 187: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 68
	i64 14124974489674258913, ; 188: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 61
	i64 14125464355221830302, ; 189: System.Threading.dll => 0xc407bafdbc707a9e => 119
	i64 14349907877893689639, ; 190: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14461014870687870182, ; 191: System.Net.Requests.dll => 0xc8afd8683afdece6 => 107
	i64 14464374589798375073, ; 192: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 193: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14556034074661724008, ; 194: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14610046442689856844, ; 195: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14669215534098758659, ; 196: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 40
	i64 14681110065883646267, ; 197: uniunity5 => 0xcbbdc7d23168093b => 88
	i64 14690985099581930927, ; 198: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 120
	i64 14705122255218365489, ; 199: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 200: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 201: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 202: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 65
	i64 14904040806490515477, ; 203: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 204: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 41
	i64 14987728460634540364, ; 205: System.IO.Compression.dll => 0xcfff1ba06622494c => 100
	i64 15076659072870671916, ; 206: System.ObjectModel.dll => 0xd13b0d8c1620662c => 109
	i64 15082578449315132289, ; 207: Plugin.Maui.Calendar => 0xd15015305063f381 => 52
	i64 15111608613780139878, ; 208: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 209: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 99
	i64 15133485256822086103, ; 210: System.Linq.dll => 0xd204f0a9127dd9d7 => 102
	i64 15203009853192377507, ; 211: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 212: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 39
	i64 15370334346939861994, ; 213: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 64
	i64 15391712275433856905, ; 214: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 41
	i64 15527772828719725935, ; 215: System.Console => 0xd77dbb1e38cd3d6f => 96
	i64 15536481058354060254, ; 216: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 217: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 72
	i64 15609085926864131306, ; 218: System.dll => 0xd89e9cf3334914ea => 122
	i64 15661133872274321916, ; 219: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 121
	i64 15783653065526199428, ; 220: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15928521404965645318, ; 221: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 46
	i64 16056281320585338352, ; 222: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 223: System => 0xe03056ea4e39aa26 => 122
	i64 16288847719894691167, ; 224: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 225: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 43
	i64 16648892297579399389, ; 226: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 37
	i64 16649148416072044166, ; 227: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 51
	i64 16677317093839702854, ; 228: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 77
	i64 16755018182064898362, ; 229: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 55
	i64 16803648858859583026, ; 230: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16890310621557459193, ; 231: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 117
	i64 16942731696432749159, ; 232: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 233: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 75
	i64 17008137082415910100, ; 234: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 91
	i64 17031351772568316411, ; 235: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 74
	i64 17062143951396181894, ; 236: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 93
	i64 17203614576212522419, ; 237: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17310278548634113468, ; 238: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17342750010158924305, ; 239: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17360349973592121190, ; 240: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 85
	i64 17514990004910432069, ; 241: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 242: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17704177640604968747, ; 243: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 73
	i64 17710060891934109755, ; 244: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 71
	i64 17712670374920797664, ; 245: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 113
	i64 17827813215687577648, ; 246: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17942426894774770628, ; 247: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 18025913125965088385, ; 248: System.Threading => 0xfa28e87b91334681 => 119
	i64 18121036031235206392, ; 249: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 74
	i64 18245806341561545090, ; 250: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 89
	i64 18305135509493619199, ; 251: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 76
	i64 18324163916253801303, ; 252: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 253: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786, ; 254: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
	i64 18370042311372477656 ; 255: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 56
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [256 x i32] [
	i32 45, ; 0
	i32 127, ; 1
	i32 50, ; 2
	i32 101, ; 3
	i32 62, ; 4
	i32 79, ; 5
	i32 80, ; 6
	i32 118, ; 7
	i32 95, ; 8
	i32 12, ; 9
	i32 56, ; 10
	i32 67, ; 11
	i32 84, ; 12
	i32 55, ; 13
	i32 75, ; 14
	i32 106, ; 15
	i32 47, ; 16
	i32 126, ; 17
	i32 57, ; 18
	i32 118, ; 19
	i32 60, ; 20
	i32 72, ; 21
	i32 105, ; 22
	i32 103, ; 23
	i32 110, ; 24
	i32 59, ; 25
	i32 112, ; 26
	i32 6, ; 27
	i32 79, ; 28
	i32 28, ; 29
	i32 80, ; 30
	i32 48, ; 31
	i32 37, ; 32
	i32 71, ; 33
	i32 67, ; 34
	i32 89, ; 35
	i32 70, ; 36
	i32 63, ; 37
	i32 115, ; 38
	i32 58, ; 39
	i32 27, ; 40
	i32 40, ; 41
	i32 2, ; 42
	i32 7, ; 43
	i32 84, ; 44
	i32 69, ; 45
	i32 108, ; 46
	i32 87, ; 47
	i32 50, ; 48
	i32 38, ; 49
	i32 81, ; 50
	i32 124, ; 51
	i32 22, ; 52
	i32 115, ; 53
	i32 39, ; 54
	i32 121, ; 55
	i32 38, ; 56
	i32 123, ; 57
	i32 78, ; 58
	i32 42, ; 59
	i32 48, ; 60
	i32 107, ; 61
	i32 103, ; 62
	i32 3, ; 63
	i32 111, ; 64
	i32 46, ; 65
	i32 33, ; 66
	i32 95, ; 67
	i32 101, ; 68
	i32 94, ; 69
	i32 54, ; 70
	i32 28, ; 71
	i32 120, ; 72
	i32 88, ; 73
	i32 58, ; 74
	i32 81, ; 75
	i32 114, ; 76
	i32 18, ; 77
	i32 26, ; 78
	i32 114, ; 79
	i32 112, ; 80
	i32 26, ; 81
	i32 29, ; 82
	i32 99, ; 83
	i32 116, ; 84
	i32 83, ; 85
	i32 54, ; 86
	i32 23, ; 87
	i32 6, ; 88
	i32 34, ; 89
	i32 70, ; 90
	i32 7, ; 91
	i32 11, ; 92
	i32 66, ; 93
	i32 44, ; 94
	i32 19, ; 95
	i32 98, ; 96
	i32 52, ; 97
	i32 108, ; 98
	i32 102, ; 99
	i32 94, ; 100
	i32 109, ; 101
	i32 104, ; 102
	i32 105, ; 103
	i32 124, ; 104
	i32 86, ; 105
	i32 14, ; 106
	i32 60, ; 107
	i32 25, ; 108
	i32 92, ; 109
	i32 69, ; 110
	i32 97, ; 111
	i32 16, ; 112
	i32 125, ; 113
	i32 92, ; 114
	i32 51, ; 115
	i32 116, ; 116
	i32 31, ; 117
	i32 77, ; 118
	i32 90, ; 119
	i32 110, ; 120
	i32 35, ; 121
	i32 125, ; 122
	i32 76, ; 123
	i32 21, ; 124
	i32 97, ; 125
	i32 31, ; 126
	i32 83, ; 127
	i32 59, ; 128
	i32 5, ; 129
	i32 29, ; 130
	i32 85, ; 131
	i32 117, ; 132
	i32 63, ; 133
	i32 91, ; 134
	i32 1, ; 135
	i32 127, ; 136
	i32 49, ; 137
	i32 104, ; 138
	i32 111, ; 139
	i32 47, ; 140
	i32 3, ; 141
	i32 19, ; 142
	i32 66, ; 143
	i32 87, ; 144
	i32 64, ; 145
	i32 1, ; 146
	i32 33, ; 147
	i32 106, ; 148
	i32 35, ; 149
	i32 43, ; 150
	i32 49, ; 151
	i32 12, ; 152
	i32 27, ; 153
	i32 8, ; 154
	i32 82, ; 155
	i32 15, ; 156
	i32 44, ; 157
	i32 65, ; 158
	i32 113, ; 159
	i32 13, ; 160
	i32 82, ; 161
	i32 42, ; 162
	i32 123, ; 163
	i32 53, ; 164
	i32 53, ; 165
	i32 30, ; 166
	i32 90, ; 167
	i32 57, ; 168
	i32 36, ; 169
	i32 68, ; 170
	i32 73, ; 171
	i32 34, ; 172
	i32 98, ; 173
	i32 61, ; 174
	i32 100, ; 175
	i32 62, ; 176
	i32 45, ; 177
	i32 0, ; 178
	i32 21, ; 179
	i32 126, ; 180
	i32 9, ; 181
	i32 86, ; 182
	i32 30, ; 183
	i32 78, ; 184
	i32 93, ; 185
	i32 96, ; 186
	i32 68, ; 187
	i32 61, ; 188
	i32 119, ; 189
	i32 23, ; 190
	i32 107, ; 191
	i32 24, ; 192
	i32 32, ; 193
	i32 36, ; 194
	i32 2, ; 195
	i32 40, ; 196
	i32 88, ; 197
	i32 120, ; 198
	i32 16, ; 199
	i32 15, ; 200
	i32 32, ; 201
	i32 65, ; 202
	i32 0, ; 203
	i32 41, ; 204
	i32 100, ; 205
	i32 109, ; 206
	i32 52, ; 207
	i32 17, ; 208
	i32 99, ; 209
	i32 102, ; 210
	i32 22, ; 211
	i32 39, ; 212
	i32 64, ; 213
	i32 41, ; 214
	i32 96, ; 215
	i32 4, ; 216
	i32 72, ; 217
	i32 122, ; 218
	i32 121, ; 219
	i32 5, ; 220
	i32 46, ; 221
	i32 24, ; 222
	i32 122, ; 223
	i32 18, ; 224
	i32 43, ; 225
	i32 37, ; 226
	i32 51, ; 227
	i32 77, ; 228
	i32 55, ; 229
	i32 17, ; 230
	i32 117, ; 231
	i32 25, ; 232
	i32 75, ; 233
	i32 91, ; 234
	i32 74, ; 235
	i32 93, ; 236
	i32 20, ; 237
	i32 10, ; 238
	i32 10, ; 239
	i32 85, ; 240
	i32 8, ; 241
	i32 20, ; 242
	i32 73, ; 243
	i32 71, ; 244
	i32 113, ; 245
	i32 11, ; 246
	i32 4, ; 247
	i32 119, ; 248
	i32 74, ; 249
	i32 89, ; 250
	i32 76, ; 251
	i32 14, ; 252
	i32 13, ; 253
	i32 9, ; 254
	i32 56 ; 255
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
