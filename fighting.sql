USE [master]
GO
/****** Object:  Database [ForumsDuLich]    Script Date: 12/24/2020 11:26:00 PM ******/
CREATE DATABASE [ForumsDuLich]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ForumsDuLich', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ForumsDuLich.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ForumsDuLich_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ForumsDuLich_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ForumsDuLich] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ForumsDuLich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ForumsDuLich] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ForumsDuLich] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ForumsDuLich] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ForumsDuLich] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ForumsDuLich] SET ARITHABORT OFF 
GO
ALTER DATABASE [ForumsDuLich] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ForumsDuLich] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ForumsDuLich] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ForumsDuLich] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ForumsDuLich] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ForumsDuLich] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ForumsDuLich] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ForumsDuLich] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ForumsDuLich] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ForumsDuLich] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ForumsDuLich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ForumsDuLich] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ForumsDuLich] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ForumsDuLich] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ForumsDuLich] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ForumsDuLich] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ForumsDuLich] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ForumsDuLich] SET RECOVERY FULL 
GO
ALTER DATABASE [ForumsDuLich] SET  MULTI_USER 
GO
ALTER DATABASE [ForumsDuLich] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ForumsDuLich] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ForumsDuLich] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ForumsDuLich] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ForumsDuLich] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ForumsDuLich', N'ON'
GO
ALTER DATABASE [ForumsDuLich] SET QUERY_STORE = OFF
GO
USE [ForumsDuLich]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 12/24/2020 11:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBaiViet] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Noidung] [nvarchar](max) NOT NULL,
	[DuongDanHinhAnh] [varchar](100) NULL,
	[MaChuDe] [varchar](20) NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[TieuDe] [nvarchar](max) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 12/24/2020 11:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[Email] [varchar](50) NOT NULL,
	[MaBaiViet] [varchar](20) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[MaBaiViet] ASC,
	[ThoiGian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CamXuc]    Script Date: 12/24/2020 11:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CamXuc](
	[Email] [varchar](50) NOT NULL,
	[MaBaiViet] [varchar](20) NOT NULL,
	[Thich] [int] NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[MaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/24/2020 11:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaChuDe] [varchar](20) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 12/24/2020 11:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[name] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/24/2020 11:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[Email] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[QuyenAdmin] [varchar](50) NOT NULL,
	[MatKhau] [char](100) NOT NULL,
	[AnhDaiDien] [varchar](100) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[MoTa] [nvarchar](100) NULL,
	[ThoiGian] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 12/24/2020 11:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[Email] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[ThoiGian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV03', N'user2@gmail.com', N'Tối 11h bắt xe Thành Bưởi di chuyển lên Đà Lạt, đến nơi 4h00 sáng thuê 1 chiếc xe máy chạy vào đồi chè Cầu Đất săn mây ngắm bình minh.


Từ cung đường từ đồi chè Cầu Đất về lại trung tâm thành phố bạn có thể ghé tham quan các điểm chụp hình vô cùng xịn xò như “Nắng xin chào”, “Vườn Hoa Cẩm Tú Cầu”, “Chùa Ve Chai”, “ Cà phê Túi Mơ To” và một số các điểm tham quan khác 😁.
👉 Ở đây là lộ trình 1 ngày chia sẻ cho các bạn nè :
4h30- 7h00 : săn mây đồi chè cầu đất
7h00-08h30: Vườn hoa cẩm tú cầu
08h30-09h30 : Cà phê túi mơ to
09h30-11h00: Khu du lịch Lá Phong ( Cà phê Kokoro)
11h00-12h30 : Ăn trưa ở quán Cơm Bờ Kè quán
12h30-14h30: Kombi land ( sa mạc xương rồng)
14h30-16h00: Về lại trung tâm thành phố chụp hình check in view hồng kông, tiệm bánh Cối Xay Gió, quảng trường Lâm Viên.
16h00-17h00 : Ăn lẩu bò ba toa
Xong lên lại xe Thành Bưởi di chuyển về lại Sài Gòn.
Kết Thúc 1 ngày vi vu Đà Lạt 😁
Ps: Đây là lịch trình tham khảo dành cho những bạn Ghiền Đà Lạt quá mà không có nhiều thời gian nè 😁', N'images/3.jpg', N'CD06', 0, N'Sài Gòn - Đà Lạt 1 ngày tại sao không ?', CAST(N'2020-02-29T20:00:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV04', N'nguyenanhdung@gmail.com', N'Không biết sở thích của bạn thế nào, nhưng với riêng mình thì khi du lịch Đà Nẵng đều lựa chọn các điểm lưu trú có vị trí gần biển. Tại sao lại thế bởi vì từ biển đến sông Hàn khá gần nhau, ước chừng chỉ khoảng 2km thôi. Rất thuận tiện cho việc di chuyển, có thể đi bộ ra biển tắm biển, vui chơi vừa có thể  tham quan các cây cầu…

Ngoài ra thì khu vực biển rất nhiều quán ăn uống hải sản, không quá đông đúc bụi bặm và khí hậu luôn trong lành. Tùy vào sở thích của mình mà bạn có thể chọn ở homestay hoặc khách sạn. Khách sạn thì có khách sạn 1,2,3 sao, nếu muốn ở cao cấp hơn nữa thì chọn 4,5 sao các resort, khu nghĩ dưỡng sang trọng. Với kinh nghiệm du lịch Đà Nẵng lần này mình xin chia sẻ đến bạn về các khách sạn chất lượng, giá cả hợp lý ở tầm mức 1 sao đến 3 sao.

Thông tin khách sạn dưới đây đều là những khách sạn mình đã trực tiếp trải nghiệm trong những lần tới Đà Nẵng. Có khách sạn mình ở một lần, có khách sạn ở tới vài lần, thậm chí có khách sạn mình ở đó cả tuần trời. Rất mong những thông tin này sẽ hữu ích cho bạn.

Đầu tiên là KHÁCH SẠN mình ưng ý nhất thuộc phân khúc 3 SAO nhưng giá lại luôn KHUYẾN MÃI rẻ không ngờ !!!

♦️ KHÁCH SẠN DƯƠNG GIA HOTEL ĐÀ NẴNG 3 SAO

Đây là khách sạn mình ưng ý nhất và đã lưu trú tận nửa tháng trong chuyến đi du lịch Đà Nẵng đầu năm 2020. Dương Gia Hotel đạt chuẩn 3 sao vị trí gần sát biển, đối diện Công Viên Biển Đông nơi có hàng ngàn chú chim bồ câu đậu kín mỗi buổi chiều.

Cách trung tâm thành phố 5 phút đi xe xung quanh rất nhiều hàng quán nổi tiếng như ẩm thực Trần cách 100 mét, Hải sản Bé mặn cách 2km, Hải sản Bé nhỏ cách 700m, Mỳ Quảng Ếch cách 300 mét.. Địa điểm tham quan như Bán Đảo Sơn Trà cách 7km, Hội An và Bà Nà Hills thẳng đường di chuyển chừng 20 phút. Cầu Rồng và Cầu Quay thì ngày sau khách sạn rất thuận tiện cho du khách khi nghỉ dưỡng tại đây.

Khách sạn Dương Gia mới khai trương nên phòng còn rất mới, sạch sẽ và đầy đủ tiện nghi. Được lát sàn gỗ sang trọng nội thất chuẩn 3 sao chắc chắn luôn làm vừa lòng du khách dù khó tính nhất khi nghỉ dưỡng tại đây..

Địa Chỉ : Số 06 – 08 Phạm Thiều – P. An Hải Bắc – Quận Sơn Trà – Đà Nẵng
Đặt phòng liên hệ Hotline : 0983.728.286 (ZALO)
Bộ phận Lễ Tân : 02363.727.286
Website : duonggiahotel.vn', N'images/4.jpg', N'CD04', 1, N'Khách sạn tốt ở Đà Nẵng', CAST(N'2020-01-25T19:00:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV06', N'lelinh@gmail.com', N'Du lịch Cần Thơ đi vào thời điểm nào cũng đẹp, vì hầu như các tỉnh miền Tây đều có kiểu thời tiết dễ chịu, khí hậu ôn hòa, không có nhiều bão lụt như miền Trung hay là mùa lạnh như miền Bắc.


Ghé Cần Thơ vào mùa hè, từ tầm tháng 5-8 bạn sẽ được thưởng thức trái cây tẹt ga vì mùa này là mùa trái cây trĩu quả mà). Thời tiết vào mùa hè cũng khá đẹp, cực kỳ thích hợp cho các hoạt động đi thuyền ngắm cảnh đẹp ở chợ nổi, “đặc sản” chỉ có ở miền Tây.

Kim Khánh
Còn từ tầm tháng 9-11 là mùa nước nổi ở miền Tây, và Cần Thơ lại có chợ nổi Cái Răng nổi tiếng nhất ở miền Tây, bạn nào từng đến đây chắc có lẽ đã có những trải nghiệm thật tuyệt vời. Ngồi trên con thuyền nhỏ, nghe sóng vỗ chồng chềnh hai bên mạng thuyền, xuyên qua những chiếc ghe nhỏ để tận mắt nhìn thấy hoạt động họp chợ vô cùng sôi nổi, với đủ các “món đặc sản” như bưởi Năm Roi, sầu riêng Cái Mơn,vv… và đủ các loại nông sản khác nữa.

Rồi kết thúc mùa nước nổi, Cần Thơ lại trở nên rực rỡ sắc màu bởi những luống hoa nở rộ vào dịp cuối năm, cũng là thời điểm mà các chợ hoa bỗng nhiên nhịp nhàng hẳn lên, người người thi nhau mua những chậu hoa thật rực rỡ để kịp chưng tết.

Note nhẹ: Cần Thơ mùa cũng đẹp cả, đẹp theo cách riêng của nó, nếu không phải là nét đẹp của mùa nước nổi thì Cần Thơ cũng luôn nhộn nhịp, bởi chợ nổi Cái Răng hoạt động quanh năm, các điểm du lịch cũng ngày một khởi sắc. Thế nên là, dù bạn quyết định đi du lịch Cần Thơ vào mùa nào, tháng nào đi chăng nữa cũng là một kỷ niệm đẹp cả.', N'images/6.jpg', N'CD08', 1, N'Thời điểm đẹp để du lịch Cần Thơ', CAST(N'2020-04-01T05:40:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV08', N'user2@gmail.com', N'Vườn sinh thái Hồng Sơn là một địa điểm du lịch sinh thái mới toanh, sắp xuất hiện ở An Giang. Với quy mô lớn cùng rất nhiều trò chơi thú vị và không kém phần thử thách, sẽ đem lại cho các bạn những trải nghiệm mới mẻ và tuyệt vời nhất.

Tọa lạc tại trung tâm thị trấn Phú Mỹ, huyện Phú Tân, du khách có thể dễ dàng di chuyển đến vườn bằng các phương tiện cá nhân hoặc công cộng. Đặc biệt có khu gửi xe rất rộng và an toàn, từ xe máy cá nhân đến xe du lịch 50 chỗ, sẽ rất thuận tiện cho bạn cũng như gia đình có thể gửi xe cả ngày mà không cần phải lo lắng. Đây hứa hẹn sẽ là một nơi vui chơi cuối tuần vô cùng thú vị cho cả gia đình.', N'images/8.jpg', N'CD08', 1, N'Khám phá vườn sinh thái Hồng Sơn ở An Giang', CAST(N'2020-04-29T20:00:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV09', N'user3@gmail.com', N'Là một Hà Nội khác hẳn đất trời miền Nam quanh năm chỉ có 2 mùa mưa nắng. Hà Nội vào thu với bầu trời xanh cao vời vợi, mặt hồ lấp lánh thủy tinh, nắng như tơ thả sợ xuống mặt hồ óng ánh,... Hà Nội dịu dàng hồi hộp đón mùa thu sang...

Tiếp tục trở lại với những entry đầy cảm xúc, chan chứa yêu thương về một thu Hà Nội trong hồi ức của Blogger Hoai Huong cùng BOOKIN.vn bạn nhé!
Trời xanh cao vời vợi màu hồ thủy, nắng như tơ, từng sợi một thả xuống óng ánh. Hà Nội dịu dàng, hồi hộp đón mùa cốm mới thơm mùi sữa lúa, hương sen thoang thỏang sót lại, những quả hồng đỏ mọng mời gọi như môi thiếu nữ, đây đó thấp thóang bóng áo nâu quẩy đôi gánh chung chiêng, bên trong lấp ló những quả thị vàng mượt, những quả ổi chín hồng tỏa mùi thơm thôn dã, bình dị, xưa xưa cổ tích…Trên những hàng cây loáng thoáng vài chiếc lá vàng… Mùa thu Hà Nội rón rén, ngập nhừng, ngấp nghé đổi chỗ mùa hạ nồng nàn cháy bỏng.


Tôi ở phương Nam, một năm chỉ có hai mùa mưa nắng. Nắng đổ xuống như chảo lửa cứ hừng hực đốt cháy cả lòng người. Mưa thì như nghiêng trời lệch đất, nước cuồn cuộn trôi, trôi tuột mọi thứ, con người cũng muốn tan theo nước mà trôi đi. Người phương Namnhư tôi đã được tặng một món quà tuyệt đẹp của phương Bắc, của Hà Nội, mà không phải lúc nào cũng có thể có. Vâng! Quà tặng - Mùa Thu Hà Nội, mùa đẹp nhất trong năm, thơ mộng nhất trong năm, mùa phương Nam không bao giờ có được. Khẽ khàng, mỏng manh trong hơi sương sớm, se se trong cơn gió nhẹ đem hương mùa bãng lãng qua các con phố… Mùa thu Hà Nội như một thứ men ngọt ngào, nhấp từng giọt, từng giọt để say hồi nào không biết, và cứ muốn say mãi.
Cốm Làng Vòng. Hương vị thu Hà Nội, nét lạ đầy ấn tượng. Những hạt cốm xanh ngọc mang hương trời khí đất, cả hồn quê và huyền thọai làng, được bọc bằng chiếc lá sen phảng phất hương thơm thóat tục, bên ngòai buộc thêm một vài sợi rơm không quá chặt, không quá lỏng, như gói những nét tinh tế lên hàng nghệ thuật một món quà dân dã của người Tràng An- người Hà Nội. Ngay cả đến cách ăn, cũng là một nghệ thuật thưởng thức nghệ thuật ẩm thực tuyện vời. Không phải xúc từng muổng (thìa) lớn như ở phương Nam khi ăn cốm dẹp trộn dừa, cứ cho hết muổng này tới muổng khác, ào ào một lúc là hết. Cốm Vòng, đựng trong lá sen, chụm mấy ngón tay nhúm vài hạt cốm, bỏ vào miệng, nhẩn nha để vị cốm dẻo, ngọt, thơm tan ra từ đầu lưỡi thấm vào…cảm hết hương vị trời, đất, đồng quê, nắng gió trong hạt cốm.
Ở phương Nam, mùa hạ là mùa hội tụ các loài cây trái. Ở Hà Nội, hình như mùa thu mới là lúc trái quả phô diễn hết sắc vị được tích tụ, chắt lọc bằng nắng gió, tinh túy đất trời suốt cả mùa hạ. Hồng đỏ mọng môi ngọt lịm, na xanh biếc mắt ngọt thanh tao, bưởi vàng mơ ngọt mát the the đầu lưỡi, nhãn nâu đất ngọt đậm đà…, đặc biệt một lọai quả chỉ có ở Hà Nội - Quả Sấu, vàng ươm, chua ngọt, một lọai quả không phải để bày biện cho đẹp cho sang, nhưng len lỏi khắp nơi, từ nhà hàng đặc sản đến bữa ăn nghèo đạm bạc bình dân, từ quí cô, quí bà sang trọng đài các đến em bé bán báo dạo trên phố. Những quả sấu chín vàng đựng đầy trong rổ hay chất một đống nhỏ trên mảnh nilong ở hè phố, ở góc chợ…, nhìn ngồ ngộ, quê mùa, xấu xí, nhưng sao hấp dẫn đến kỳ lạ. Tôi đã đứng thật lâu quan sát, thấy thứ quả bình thường mà có sức mê hoặc đến hết thảy mọi người không phân biệt sang hèn. Thảo nào, mà trong văn trong thơ viết về Hà Nội, nhiều người nhắc đến quả sấu như một nỗi nhớ, một mối tình vấn vương, một kỷ niệm ấu thơ rất riêng của Hà Nội, không lẫn vào đâu được.
Một trưa nắng nhẹ, lang hang phố cổ vắng tiếng xe, trong bóng cây sẫm màu lốm đốm nắng, bóng dáng áo nâu, tóc bạc quẩy một gánh quả có mùi thơm là lạ, thong dong ngược lại, đi qua tôi, như bất chợt vấp phải một cái gì đó mơ hồ, tôi quay lại níu lấy bà… Ôi quả thị, quả thị của nàng Tấm trong cổ tích. Tròn đầy, xinh xắn, vàng mướt màu nắng, và mùi thơm là tổng hòa mùi lúa chín, mùi rơm mới,mùi bếp lửa, mùi làng quê… Bà cười hiền hậu (không biết có phải là bà lão bán quán nước đã rước quả thị nàng Tấm về nhà trong cổ tích), tặng tôi một quả thị thật đẹp cùng câu chúc rất cổ tích: Cô sẽ gặp được người tri âm tri kỷ. Và đêm ấy, trong giấc mơ của tôi, bước ra từ quả thị là một chàng trai, như hòang tử trong truyện thần thọai, đến với tôi… Tỉnh dậy, nhìn ra ngòai cửa sổ, sương lễnh lõang trong ánh trăng non mờ ảo, và mùi thơm quả quả thị sực nức căn phòng…


Mùa thu Hà Nội, không chỉ là cái nắng vàng tơ mơn man, ấm áp, là bầu trời thăm thẳm trong vắt không gợn mây giữa trưa, là hương quả đầy mời gọi, mà còn là nét quyến rũ đến ngọt say người phương Nam từ những đêm trăng và hoa sữa. Đêm và hoa mùa thu Hà Nội đẹp lạ lắm. Đêm tĩnh lặng, nhẹ lâng lâng, trong veo. Những ồn ào, vất vả của ngày hình như ngủ theo mặt trời, chỉ nghe có tiếng ri rỉ của dế, tiếng sột sọat của chiếc lá rơi, xa xôi đâu đó tiếng cá quẫy nước giỡn trăng trong hồ… Ánh trăng gần rằm phủ xuống vầng sáng mát lạnh như ướp đá, bóng hàng cây hoa sữa sẫm màu, để nổi bật những chấm trắng lấm tấm của từng chùm hoa, như một vệt ngân hà lạc xuống. Đêm đẹp như mộng. Đêm sóng sánh, hoa sữa ngọt say tung thả mùi hương theo gió lan tỏa cả mặt hồ loáng ánh bạc của trăng. Trăng, hoa lẫn vào sương giăng mỏng mờ, lãng đãng, chồng nhòe cảnh vật ẩn hiện, bí ẩn. Bầu trời lấp lánh các vì sao như bức tranh cẩn vụn kim cương của nghệ sĩ thần tiên dành riêng ban tặng cho những ai thức cùng đêm. Tôi đã đi như thế, cảm nhận vẻ đẹp liêu trai của đêm thu Hà Nội mãi đến khi sương tụ lại từng giọt đọng trên lá cỏ, như giọt nươc mắt đêm, và xa xa dội lại nhịp thở của một này mới sắp bắt đầu.
', N'images/9.jpg', N'CD02', 1, N'Mùa thu Hà Nội trong nỗi nhớ', CAST(N'2020-01-10T19:19:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV1', N'duongphuongnam1@gmail.com', N'Năm 2019 vừa rồi mình trở lại Nha Trang thêm 2 lần nữa và trong 2 lần này mình đã đi thêm được kha khá các địa điểm, ở khoảng hơn chục khách sạn từ 3 đến 5 sao và cũng có đi thử một vài tour ghép trong ngày để có thêm trải nghiệm, review lại cho các bạn. Bởi vậy, mình tin chắc rằng những kinh nghiệm du lịch Nha Trang mình chia sẻ dưới đây sẽ cực kì hữu ích dành cho bạn đó <3
Mình đã từng có “ác cảm” rất lớn dành cho du lịch Nha Trang trong những lần đầu tiên đến đây và đã từng chỉ muốn ngồi lì trong phòng nhiều ngày liền chả muốn đi đâu vì cái ác cảm đấy. Nhưng rồi lần thứ 2, thứ 3 rồi những lần tiếp sau đó, khi mình “khôn” hơn chút, chịu khó khám phá, trải nghiệm mới thấy Nha Trang QUÁ ĐẸP, QUÁ TUYỆT VỜI! Mình dành một sự ngưỡng mộ về du lịch biển ở nơi đây – thành phố Nha Trang xinh đẹp <3
Cho đến lần gần nhất vào cuối năm 2019 rồi, mình còn thấy choáng ngợp và ngưỡng mộ bởi sự đồ sộ của các khách sạn, tòa nhà ở Nha Trang. Toàn nhà cao tầng, khách sạn 4-5 sao. Đến nỗi mình thấy để tìm một khách sạn 1-2 sao ở đây còn khó hơn là 3,4 hay 5 sao.', N'images/Tau-du-lich-nha-trang-1.jpg', N'CD05', 1, N'Kinh nghiệm du lịch cho những ai chưa đi ', CAST(N'2020-12-24T22:50:38.167' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV10', N'lelinh@gmail.com', N'Trung tâm kinh tế, văn hóa, du lịch trong cả nước Tp Hồ Chí Minh thật sự là nơi bạn muốn tìm gì cũng có. Nơi có đầy đủ và phong phú các mặt hàng, dịch vụ cho đến các loại hình giải trí. Và dù cho bạn có là một du khách vô tình dừng chân tại Sài Gòn hay đã sống tại đây đủ lâu để tự gọi mình là dân thành phố, Sài Gòn vẫn có những điểm đến khiến bạn phải ngạc nhiên và yêu thích. Hãy cùng  tụi mình lên đường khám phá kinh nghiệm du lịch Sài Gòn tự túc ngay, bạn nhé,…
Chi phí di chuyển
Nếu bạn chọn phương tiện sang chảnh như máy bay thì giá giao động từ 3,5 triệu đến 5,5 triệu cho vé khứ hồi nếu bạn bay từ Hà Nội. Vé tàu hỏa sẽ khoảng trên dưới 1 triệu. Xe khách cũng tương tự giá tàu hỏa, tùy điểm xuất phát của bạn nữa nhé. Còn trong nội thành bạn có thể thuê xe máy để di chuyển đến những điểm vui chơi.
Chi phí lưu trú
Lưu trú ở thành phố thì bạn không cần phải quá lo lắng. Tại trung tâm có rất nhiều khách sạn cho bạn lựa chọn. Từ sang chảnh 5 sao như: New world, Sheraton, Pullman, Mường Thanh… Hoặc bạn có thể chọn những nhà nghỉ, khách sạn 2 3 sao lân cận nơi bạn muốn đến vui chơi cho tiện. Những khu có nhiều khách sạn như Phan Xích Long, Sư Vạn Hạnh, dọc đường bờ kè Hoàng Sa Trường Sa. Giá cũng tùy vào độ tiện nghi bạn lựa chọn giao động từ 200,000-500,000/ngày. Có cả loại hình cho thuê giờ cho những bạn chỉ có nhu cầu nghỉ trưa hoặc tắm táp chuẩn bị di chuyển đến địa điểm vui chơi tiếp theo.
Chi phí ăn uống
Sài Gòn có thể nói là kinh đô ăn uống của Việt Nam. Tại thành phố này bạn có thể dễ dàng ăn uống đặc sản của tất cả mọi vùng miền khác, thậm chí của các quốc gia khác nữa. Nhưng nếu muốn thử một chút gì đó đậm chất Sài Gòn thì những món như bò tơ Củ Chi hoặc cơm tấm là những thứ bạn không nên bỏ qua. Giá cả cho một bữa ăn sáng tại Sài Gòn có thể từ 5 – 30 nghìn, bữa trưa/ tối khoảng 30 – 50 nghìn.


', N'images/10.jpg', N'CD07', 1, N'Kinh nghiệm du lịch Sài Gòn', CAST(N'2020-03-15T21:00:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV11', N'khanhnguyenk8@gmail.com', N'Hồ Xuân Hương Đà Lạt làm say đắm biết bao nhà thơ, nhà văn từ bao nhiêu thế hệ. Đây là điểm du lịch được nhắc tới như một biểu tượng của thành phố hoa quy tụ nhiều cảnh đẹp lãng mạn, trữ tình để lại dấu ấn sâu sắc trong lòng du khách.
Kể về sự tích hồ Xuân Hương Đà Lạt
Nếu bạn đang thắc mắc Đà Lạt có gì đẹp, đi đâu, chơi gì nhất định không thể bỏ qua hồ Xuân Hương. Đây là hồ nhân tạo có hình trăng lưỡi liềm rộng tới 25ha với cảnh vật xung quanh bốn mùa tươi đẹp. Sự tích hồ Xuân Hương Đà Lạt được truyền tụng cho đến ngày nay với nhiều giai thoại lý thú. Khoảng đất hồ ngày trước là dãy đầm lầy bạt ngàn được công sứ Pháp dẫn nước từ suối Cam Ly và ngăn đập tạo hồ sau khi thấy tiềm năng về cảnh quan nơi đây.
Năm 1919, hồ được khởi công xây dựng và phải qua đến 5 năm chính quyền mới quyết định làm thêm một con đập để tách hồ lớn thành 2 hồ nhỏ hơn. Năm 1953, nhà báo Nguyễn Vỹ lúc đấy là Chủ tịch hội đồng xã Đà Lạt quyết định chuyển tên hồ thành hồ Xuân Hương – tên của nữ nhà thơ nổi tiếng vào đầu thế kỷ 19.
Hồ Xuân Hương ở Đà Lạt nằm ngay trung tâm thành phố. Nơi đây có vô vàn homestay Đà Lạt view đẹp miễn chê, tiện nghi đầy đủ cho bạn lựa chọn và rất nhiều quán ăn ngon, bổ, rẻ phục vụ du khách. Bạn hãy tham khảo kinh nghiệm đặt phòng, khách sạn tại Đà Lạt để nhận được dịch vụ tốt và giá ưu đãi nhất nhé
Hồ Xuân Hương Đà Lạt rộng bao nhiêu? Cho đến này đây là một trong những hồ nước lớn nhất Đà Lạt. Vị trí của hồ Xuân Hương có vị trí rất dễ tìm nằm ngay phường 1, thành phố Đà Lạt bao quanh là đường Trần Quốc Toản. Du khách có thể đón taxi hoặc xe ôm để thuận tiện dạo chơi quanh hồ.
Hồ Xuân Hương ở Đà Lạt là “nàng thơ” trong lòng của biết bao nhà thơ, nhà văn với vẻ đẹp mơ mộng, yên bình hiếm thấy. Quang cảnh quanh hồ với vườn hoa, rừng thông và công viên đầy hoa lá tạo khung cảnh trong lành, thoáng mát.
Khi ánh hoàng hôn buông dần xuống hồ, nơi đây lại khoác lên mình vẻ đẹp mơ hồ, huyền bí với áng chiều rực rỡ in xuống mặt hồ phẳng lặng.


', N'images/11.jpg', N'CD06', 1, N'Hồ Xuân Hương Đà Lạt', CAST(N'2020-02-15T19:08:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV12', N'khanhnguyenk8@gmail.com', N'Du lịch Đà Lạt từ lâu đã được coi là điểm đến “quốc dân” khi luôn biết cách “hớp hồn” du khách bằng phong cảnh thiên nhiên tuyệt đẹp hay những tọa độ “sống ảo” vi diệu. Mà đã đến đây thì nhất định không thể bỏ qua làng hoa Vạn Thành Đà Lạt – một trong những làng hoa lâu đời nhất ở thành phố ngàn hoa này đó!
Khí hậu Đà Lạt quanh năm mát mẻ, trong lành lại thêm phong cảnh thiên nhiên hữu tình với trăm ngàn hoa khoe sắc nên dù bạn đi vào mùa nào trong năm thì cũng đều ngắm được vẻ đẹp của những loài hoa ở đây.
Tham quan làng hoa Vạn Thành Đà Lạt vào mấy tháng đầu năm, bạn sẽ được chứng kiến những hoa mai anh đào Đà Lạt đua nhau nở bông hồng đào rực rỡ, đến tháng 10 – 11 thì đúng thời gian “săn” hoa dã quỳ Đà Lạt đang độ vàng rực cực đẹp hay tới tháng 12 thì lại có đồi hoa hướng dương nhuộm vàng cả một thung lũng. Tuy mùa nào cũng có loài hoa nở tượng trưng nhưng để ngắm được làng hoa Vạn Thành đẹp nhất thì bạn nên đi vào tháng 10, 11 và 12. Do thời điểm này làng hoa đặc biệt trồng rất nhiều loài hoa để phục vụ cho Festival Hoa và Tết Nguyên Đán đó!
Làng Hoa Vạn Thành cách trung tâm Đà Lạt khoảng 3 km, tọa lạc tại số 40 Vạn Hạnh, phường 5, thành phố Đà Lạt, nằm chung cung đường với làng Cù Lần nên nếu bạn đã đi tham quan ở đây thì nên tranh thủ ghé thêm làng hoa Vạn Thành nữa nhé!
Nhiều bạn chưa đi làng hoa Vạn Thành Đà Lạt chắc chắn sẽ băn khoăn về đường đi đến đây nhưng giờ đã không sao khi Chudu24 hướng dẫn đường đi chi tiết cho bạn nè! Thật ra đường đi làng hoa không khó, bạn chỉ cần đi men theo đường đến thác Cam Ly, hướng đèo Tà Nung, sau đó vừa đi vừa nhìn qua phía bên trái, chỉ cần thấy tấm bảng hiệu cực to ghi “Làng hoa Vạn Thành” là bạn đã tới được làng hoa nổi tiếng bậc nhất Đà Lạt rồi nhé!

', N'images/12.jpg', N'CD06', 1, N'Làng Hoa Vạn Thành đẹp ngây ngất', CAST(N'2020-10-10T00:09:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV13', N'user1@gmail.com', N'Chợ Đà Lạt là địa điểm mà bất cứ du khách nào đến với thành phố Festival hoa đều không muốn bỏ lỡ để tham quan. Bài viết này Hoa Dalat Travel sẽ giới thiệu để mọi người biết chợ đà lạt bán gì và chợ đà lạt có gì.
Chợ không rõ đã có từ lúc nào, nhưng cho đến khi Hébrard hoàn thành đồ án quy hoạch thị xã Đà Lạt vào năm 1923 thì người ta cũng được biết đến một ngôi chợ ở vị trí ấp Ánh Sáng ngày nay.
Năm 1929, khi dân số Đà Lạt đã lên đến 2.000, công sứ Chassaing đã cho dời ngôi chợ này về khu vực mà ngày nay gọi là khu Hòa Bình. Hồi ấy chợ được dựng bằng ván gỗ lợp mái tôn nên còn được gọi là “chợ cây”.
Từ 1935 – 1937, công sứ Lucien Auger đã cho xây dựng một khu chợ mới bằng gạch khang trang hơn trên nền chợ cũ, và đã giao cho hãng S.I.D.E.C thiết kế thi công. Ngôi chợ mới với kiến trúc giản dị nhưng khá độc đáo đã một thời là niềm tự hào của người dân Đà Lạt.
Hiệp định Genève năm 1954 đã làm cho dân số Đà Lạt tăng vọt lên trên 50.000 người, lúc này ngôi chợ đã quá tải, lại bị một đầm xà lách cùng rác rưởi bên cạnh làm ô uế cảnh quan, Thị trưởng bấy giờ là Trần Văn Phước đã quyết định xây dựng ngay tại vị trí đầm rác một ngôi chợ lầu đầu tiên của Việt Nam.
Ngôi chợ này đã được kiến trúc sư Nguyễn Duy Đức và các kỹ sư Việt Nam thiết kế, nhà thầu Nguyễn Linh Chiếu đảm trách phần thi công – công trình khởi công từ năm 1958 đến năm 1960 mới hoàn thành.
Khi kiến trúc sư Ngô Viết Thụ ở Pháp về, ông được mời tham gia chỉnh trang ngôi chợ mới và đã thiết kế chiếc cầu thang nối tầng 2 chợ với khu Hòa Bình, cũng như hệ thống đường xá, nhà phố chung quanh chợ.
Cùng thời gian này chính quyền cũng đã nhờ hai kiến trúc sư Huỳnh Kim Mãng và Lâm Du Tốt thiết kế cải tạo ngôi chợ cũ thành rạp hát Hòa Bình (nay là Rạp 3 – 4) với các quầy hàng thương mại dịch vụ chung quanh như hiện nay.


Đi du lịch hôm nay và ghé thăm chợ Đà Lạt du khách có thể hài lòng với các mặt hàng thật phong phú, các quầy hàng ăn uống sạch sẽ vệ sinh và giá cả ổn định.
Chợ Đà Lạt khá đa dạng và phong phú với các chủng loại hàng hóa gồm: rau Đà Lạt (bắp cải, súp lơ, bông atisô, tầng ô, bó xôi,…); hoa Đà Lạt (hồng, cúc, cát tường, lily, layơn, huệ trắng,…); đặc sản Đà Lạt (dâu tây, hồng, bơ, mứt dâu, nước cốt dâu, khoai lang dẻo, hồng khô, rượu cần, rượu vang và một số loại mứt khác); quầy hàng ăn uống với đầy đủ các món ăn từ ba miền Bắc Trung Nam; quầy hàng may mặc, đặc biệt là hàng len (áo len, mũ len, khăn len,… từ hàng dệt đến hàng đan tay đều có); quầy hàng lưu niệm, v.v…
Chợ Đà Lạt không hoạt động về đêm, mở cửa lúc 7h00 và đóng cửa lúc 19h00 hàng ngày. Tuy nhiên, chợ âm phủ Đà Lạt lại xuất hiện với các mặt hàng như: hàng len, hàng ăn uống, rau quả để du khách vừa mua sắm vừa đi dạo ngắm cảnh ban đêm ở trung tâm thành phố Đà Lạt
', N'images/13.jpg', N'CD06', 1, N'Chợ Đà Lạt', CAST(N'2020-10-16T21:01:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV14', N'nguyenanhdung@gmail.com', N'Một trong top 20 địa điểm du lịch hot nhất Đà Lạt. Mà du khách không thể nào bỏ qua khi đến đây du lịch. Đó chình là đồi Chè Cầu Đất Đà Lạt. Đồi chè Cầu Đất farm – Một màu xanh của thiên nhiên như được quy tụ tại nơi đây. Đồi chè Cầu Đất là một điểm du lịch. Thu hút đông đảo các bạn trẻ đến đây tham quan. Bất cứ ai đến Đà lạt đều không bỏ qua địa điểm này.
Đồi chè cầu đất Đà Lạt là địa điểm du lịch ăn khách nhất tại Đà Lạt. Hằng năm nơi đây thu hút rất nhiều khách du lịch đến đây tham quan và chụp hình. Nơi đây còn được du khách ví như thiên đường sống ảo của giới trẻ. Một mét vuông ở đây có thể cho ra đời hàng ngày bức ảnh sống ảo khác nhau.
Đồi chè Cầu Đất Đà Lạt đang là địa điểm thu hút nhiều khách du lịch tại Đà Lạt. Địa điểm du lịch này trong những năm gần đây đang làm mưa làm gió. Bởi vẻ đẹp thu hút du khách, mê hoặc lòng người. Đồi chè Cầu Đất đã chiếm chọn được bao trái tim của những vị khách.
Nơi đây quả thật là một địa điểm du lịch đầy hứa hẹn dành cho du khách. Tình đến thời điểm này đồi chề Cầu Đất đã đón tiếp hàng ngàn vị khách du lịch. Là một thánh địa sống ảo dành cho biết bao du khách. Nơi đây còn là một địa điểm lý tưởng cho bạn chụp ảnh cưới. Du khách còn chừng chờ gì nữa mà không nhanh tay xách balo lên và đi thôi nào.
Đồi chè Cầu Đất Đà Lạt là địa điểm du lịch nằm ở ngoại ô thành phố Đà Lạt. Đường đi đến đồi chè là một khung cảnh thiên nhiên tuyệt đẹp. Mà bất cứ du khách nào không không khỏi những lời trầm trồ và khen ngợi. Đồi chè Cầu Đất Đà Lạt có diện tích rộng khoảng 220 héc ta. Nơi đây vừa là địa điểm du lịch lý tưởng tại Đà Lạt. Mà đồi chè này còn là nhân chứng của lịch sử. Chứng kiến biết bao nhiêu thăng trầm trong cuộc sống là nhân chứng sống tại Đà Lạt.
Nơi đây có một tác phẩm đã ghi dấu ấn rất lâu đời. Đó chính là 100 năm hình thành và phát triển của nhà máy trà cầu đất. Đó chính là tác phẩm 1 bình trà có chiều cao 2,6 mét. Chiều ngang 7,1 mét và nặng khoảng 3 tấn. Nếu du khách đến tham quan đồi chè đừng quên địa điểm này nhé.
Cầu Đất farm Đà Lạt là một nơi chuyên sản xuất chè. Hàng năm nơi đây cho ra trung bình khoảng hơn 1000 tấn trà tươi đưa đi tiêu thụ cả nước. Cùng với đó là khoảng 260 tấn chè khô đi chế biến để làm sản phẩn phục vụ khách hàng.
Đồi chè cầu đất Đà Lạt là địa điểm du lịch nằm ngoại ô cả thành phố. Địa điểm này nằm trên địa bàn thôn Cầu Đất, xã Xuân Trường. Cách trung tâm thành phố Đà Lạt tầm 20 km. Đồi chè Cầu Đất là một tên gọi khác của doanh nghiệp chè Cầu Đất Farm.
Khi du khách lên trên Cầu Đất Farm một khung cảnh vừa bình yên. Vừa hùng vĩ hiện ngay trước mắt bạn. Với diện tích khoảng 220 ha một không gian khá rộng. Đồi chè Cầu Đất được đánh giá là địa điểm check in. Hoành tráng và chất lượng hàng đầu Đà Lạt. Nơi đây được rất nhiều du khách trong lẫn ngoài nước đến đây tham quan. Cùng với đó là những lời khen ngợi không ngừng về địa điểm du lịch này.


Lúc trước khi du lịch nơi đây thì hoàn toàn miễn phí. Nhưng vào tháng 8 năm 2018 nơi đây đã bắt đầu thu phí tham quan. Khi đến đây các bạn như lạc vào thế giới toàn màu xanh của thiên nhiên. Những lá chè xanh tươi nhảy múa dưới nắng vàng. Khung cảnh thật thơ mộng làm sao.
', N'images/14.jpg', N'CD06', 1, N'Đồi chè Cầu Đất', CAST(N'2020-10-12T19:35:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV15', N'khanhnguyenk8@gmail.com', N'Chào các bạn..!
Vừa rồi mình có một chuyến du lịch Bến Tre một ngày và mình đã có những trải nghiệm thú vị và hấp dẫn nơi đây. Tuy chỉ 1 ngày, nhưng nơi naỳ đã để lại cho mình một ấn tượng vô cùng sâu sắc và khó quên.

Để có thể giúp cho những bạn đang ấp ủ ước mơ đi du lịch bến tre một cách dễ dàng hơn. Chính vì vậy, mình đã bỏ thời gian để viết bài này giúp các bạn định hướng được sẽ đi đâu, làm gì, ăn gì chỉ với 1 ngày ở Bến Tre.
Bến Tre không chỉ là một tỉnh Tây Nam – Miền Nam là một trong số những điểm có sự thu hút khách du lịch khá lớn, bởi dòng sông bao la, kênh rạch, rừng tự nhiên, hệ sinh thái đa dạng, … Đặc biệt được du khách khắp cả nước biết đến với biệt danh là Xứ dừa.

Buổi sáng đi đâu?

Buổi sáng, du khách sẽ đến bến tàu để đi dọc sông Bến Tre, khám phá cuộc sống của người dân địa phương với các hoạt động như câu cá …
Buổi trưa ăn gì?

Vào buổi trưa, du khách có thể dừng chân tại nhà hàng gần đó để thưởng thức các món ăn hấp dẫn của Bến Tre như cá lóc nướng, cá ngừ hấp bưởi …
Buổi chiều đi đâu?

Sau giờ ăn trưa, du khách nên đi thuyền dọc theo kênh rạch, chiêm ngưỡng những cây dừa xung quanh, khám phá hệ động thực vật phong phú của nơi đây. Đặc biệt, du khách có thể học lái thuyền dưới sự hướng dẫn của người dân địa phương.
', N'images/15.jpg', N'CD08', 1, N'Một ngày du lịch Bến Tre', CAST(N'2020-10-17T20:30:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV16', N'user3@gmail.com', N'Tới thăm chợ nổi miền Tây là thứ khiến tôi mê tít sau những cánh hoa bát ngát vùng Tây Bắc vì thế tôi đã tranh thủ đặt tour du lịch tới chợ nổi Cái Răng, Cần Thơ trong dịp về Việt Nam năm ngoái. Dịp Tết này, nếu bạn có dịp về miền Tây thăm quê hương họ hàng, sao lại có thể bỏ lỡ một khu chợ đặc biệt như chợ nổi Cái Răng?
Do không còn thích đi tour nữa nên tôi đã lên kế hoạch đi một mình, xách ba lô và tới với Cần Thơ. Tôi đã có cho mình kha khá kinh nghiệm thú vị ở đây nhé, nếu bạn muốn biết tôi sẵn sàng chia sẻ ngay bây giờ!


Từ Sài Gòn tới Cần Thơ thì đi như thế nào nhỉ? Tôi đã “trao đổi” kha khá với anh bạn thân Google để tìm ra đáp án cho câu trả lời của mình. Có hai phương án là đi xe máy hoặc đi ô tô.
Tôi chọn đi ô tô vì muốn dành thêm thời gian nghỉ ngơi, dưỡng sức trên xe trước khi quậy tung chợ nổi Cái Răng, Cần Thơ. Có khá nhiều chuyến xe khác nhau di chuyển giữa hai thành phố; tôi chọn Thành Bưởi với giá 115,000 VND / lượt đi vì bạn tôi nói rằng hãng xe này khá uy tín. Ngoài ra bạn cũng có thể chọn mua vé xe Phương Trang theo số 1900 6067.
Nếu bạn muốn đi xe máy hãy tìm đường tới quốc lộ 1A, sau đó đi theo hướng cầu Mỹ Thuận, hãy rẽ trái theo hướng đi về Cần Thơ. Trên đường có khá nhiều biển chỉ dẫn nên bạn không sợ bị lạc đâu nhé. Đi xe máy sẽ tốn của bạn khoảng 4 giờ đi xe.
Vậy là đã tới Cần Thơ rồi nhé. Từ đây, bạn hãy tìm tới bến Ninh Kiều, Cần Thơ để đi thuyền ra chợ nổi Cái Răng. Khu chợ này nằm trên sông Cái Răng, cách trung tâm thành phố khoảng 6km đường bộ.
Nếu bạn đi đông thì có thể thuê thuyền riêng cũng được nhé, thuyền có thể chở được từ 10 tới 12 người với giá từ 500,000 VND tới 800,000 VND tuỳ vào khả năng mặc cả của bạn.
Riêng tôi, vì đi một mình nên phải đi ghép với những người khác, vé của tôi giá 30,000 VND. Tất nhiên nếu bạn có khả năng mặc cả tốt hơn tôi thì chi phí có thể giảm xuống một chút nhé. Hãy trả thêm khoảng 10,000 VND nếu bạn muốn ghé qua thăm cầu Cần Thơ.
Nhìn chung bạn sẽ tốn khoảng 30 phút để đi thuyền từ bến tới chợ nổi Cái Răng – một trong những khu chợ đông đúc ở Đồng bằng sông Cửu Long. Nhất định bạn cũng sẽ có cảm giác thích thú choáng ngợp giống tôi khi đắm mình trong không khí buôn bán sôi nổi chân chất của người dân miền sông nước
Chợ nổi Cái Răng họp khá sớm đó nhé từ khoảng 4, 5 giờ sáng các ghe xuồng đã bắt đầu cập chợ vậy nên bạn cần đi sớm một chút, tính toán dư thời gian để có thể tới chợ lúc đông vui nhất.
Tôi xuống tàu rời bến Ninh Kiều để tới chợ nổi lúc 4 giờ 30, khoảng 5 giờ tôi đã có mặt tại đây. Lúc này trời vẫn còn hơi tối, mặt trời chưa ló dạng cộng thêm gió trên sông hiu hiu thổi khiến tôi khá dễ chịu nhưng cũng khá buồn ngủ.
Thật may là tiếng buôn bán của khu chợ đã khiến tôi vượt qua cơn ngủ và trở lại với “cuộc vui”. Hãy chắc rằng bạn không ngủ gật nhé, vì bỏ lỡ chợ nổi sẽ buồn lắm đấy!
Có nhiều lí do khiến tôi muốn tới thăm lại chợ nổi Cái Răng sau lần thăm hụt năm ngoái. Đầu tiên là những khung cảnh nhộn nhịp nơi đây đã làm tôi lưu luyến.
Tiếp đến chính là những chiếc xuồng chở đầy hàng. Nghe lạ quá phải không? Thế này nhé, bình thường bạn chỉ có thể thấy người ta tụ tập chợ và bán hàng trên đất thôi, còn bán hàng trên ghe xuồng như thế này quả thực rất ít.
Mỗi một chiếc ghe sẽ bán một món hàng khác nhau, từ hoa quả ngon lành tươi rói của miền Tây tới những đồ gia dụng cần thiết cho cuộc sống thường ngày. Chủ các chiếc ghe sẽ treo món đồ mình bán lên một cây sào – người dân ở đây gọi là cây “bẹo” để người mua có thể dễ dàng nhận ra.
Chưa hết nhé, các món ăn cũng được bán trên ghe luôn. Tôi không thể nào quên cảm giác ngồi trên chiếc ghe nhỏ chòng chành trên dòng nước và thưởng thức bát bún riêu đậm chất miền Tây (giá 15,000 VND nhé).  Đây có thể nói đó là kỉ niệm thú vị nhất nhì trong chuyến đi của tôi.
Ngoài ra nếu bạn muốn ăn trái cây tươi thì có thể nhờ người bán hàng gọt luôn cho nhé, họ cực kì thân thiện đấy.
Nếu không có dịp ghé thăm miền Tây sông nước thì hẳn chẳng bao giờ có thể thấy và trải nghiệm qua. Nên chăng đây được tính là lí do kéo tôi tới với chợ nổi Cái Răng, Cần Thơ.


', N'images/16.jpg', N'CD08', 1, N'Một ngày ở Chợ nổi Cái Răng Cần Thơ', CAST(N'2020-12-12T19:45:00.000' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV18', N'user1@gmail.com', N'hè này mk tính đi du lịch lên sapa, ai đã từng đi thì chỉ mình với ai có ý định đi thì mình lập team đi nè ', N'images/Sapa-tháng-10.jpg', N'CD01', 1, N'Xin kinh nghiệp đi sapa', CAST(N'2020-12-24T23:01:24.297' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV19', N'user2@gmail.com', N'Miến lươn bà Phấn
Địa chỉ: Số 999 Trần Hưng Đạo, thành phố Ninh Bình 

Miến lươn bà Phấn được biết đến là một địa chỉ quán ăn sáng ngon ở Ninh Bình luôn đông nghìn nghịt khách, không chỉ những người dân địa phương mà ngay cả những vị khách du lịch khi tới Ninh Bình cũng muốn được thưởng thức món miến lươn nổi tiếng trứ danh này!
Chân gà nướng phố 8
Địa chỉ: phố 8, gần trường chuyên THPT Lương Văn Tụy, Ninh Bình. 

Không chỉ nổi tiếng với những món ngon đặc sản như cơm cháy hay thịt dê mà ở Ninh Bình còn có một quán cực nổi tiếng với món chân gà nướng vô cùng hấp dẫn này đó! Chân gà được làm sạch cẩn thận và tẩm ướp hương vị đậm đà sau đó nướng trên than hoa thơm lừng, chấm cùng nước mắm pha chua cay và uống kèm rượu nếp Kim Sơn, chỉ cần ngửi thôi đảm bảo bạn sẽ thấy rất ngon rồi!
Bánh đa cá rô Liên Đồng
Địa chỉ: Số 94 Hoàng Diệu, phường Thanh Bình, Ninh Bình 

Thêm một quán ngon Ninh Bình mà nhất định bạn phải thưởng thức khi ghé tới đây chính là món bánh đa cá rô. Bật mí cho bạn, ở vùng ven đồng chiêm trũng Ninh Bình có rất nhiều cá rô đồng chính vì vậy mà người dân nơi đây đã tận dụng để chế biến ra món bánh đa cá rô vô cùng hấp dẫn.', N'images/6MsTZl1jNfOqnLx0rp2jbZcb6lBOzXJn.jpeg', N'CD09', 1, N'Món Ngon Ninh Bình ', CAST(N'2020-12-24T23:06:53.870' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV2', N'duongphuongnam1@gmail.com', N'Vinpearl Land
Địa chỉ: 98B/13, Trần Phú, Lộc Thọ, Thành phố Nha Trang, Khánh Hòa

Toạ lạc trên đảo Hòn Tre xinh đẹp giữa biển khơi và bãi biển trong xanh quanh năm, Vinpearl Land được biết đến như điểm đến du lịch Nha Trang – “thiên đường của miền nhiệt đới” hấp dẫn mọi du khách.
Ngoài các khu vui chơi dành cho gia đình và trẻ em, Vinpearl Land còn có Công viên nước Vinpearl. Với các đường trượt có độ dốc lớn nhất là 21.5m, khu vực giải trí này thường phục vụ những du khách ưa thích cảm giác mạnh. Trong đó, một đoạn Hang Rùng Rợn dài 56m cũng sẽ làm thoả mãn niềm đam mê thám hiểm của nhiều du khách trẻ tuổi. Hơn nữa, nơi này còn thu hút du khách bởi rạp chiếu phim 4D hoành tráng.
Bên cạnh những phương tiện đi lại thông thường như ca nô, taxi, tàu cao tốc và phà, khách tham quan còn có thể sang đảo Hòn tre bằng hệ thống cáp treo dài 3.320m. Đây là cáp treo dài nhất thế giới với 9 cột trụ trên biển và đất liền. Tuyến cáp có cấu trúc giống tháp Eiffel, đặc biệt vào ban đêm sẽ được thắp sáng bằng laser. Hệ thống cáp này có thể chuyên chở 1000 – 1.500 người/giờ. Nhờ đó, việc qua lại giữa đảo và đất liền được dễ dàng hơn.
Viện Hải dương học
Địa chỉ: số 1, Cầu Đá, Trần Phú, thành phố Nha Trang, tỉnh Khánh Hòa.

Viện Hải dương học Nha Trang là nơi nghiên cứu đời sống các loài động thực vật biển tại thành phố Nha Trang tỉnh Khánh Hòa.Viện này được thành lập vào năm 1923 có địa chỉ tại số 1 Cầu Đá, cách trung tâm thành phố Nha Trang khoảng 6km về phía Đông Nam.
Địa điểm du lịch này có trên 20.000 mẫu vật của 4.000 loại sinh vật biển được lưu giữ, sưu tầm và nuôi dưỡng trong nhiều năm. Đặc biệt, đây còn là nơi trưng bày một bộ xương cá voi khổng lồ có chiều dài gần 26m, cao 3m với 48 đốt sống đã được phục chế rất đầy đủ. Du khách đến đây sẽ được tham quan khu thí nghiệm, ngắm các sinh vật lạ và biết thêm nhiều điều về cuộc sống của các loài sinh vật ở biển.', N'images/vien-hai-duong-hoc-1-e1505371345312.jpg', N'CD05', 1, N'Điểm vui chơi Nha Trang nha ', CAST(N'2020-12-24T22:53:25.587' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV20', N'admin@gmail.com', N'Bên cạnh là địa điểm du lịch Hà Nội hấp dẫn, phố cổ Hà Nội còn là nơi lưu giữ không gian văn hóa xưa của con người thủ đô. Với kiến trúc đặc trưng cuối thế kỉ 19, khu phố cổ gồm những ngôi nhà san sát, ngõ ngách đan xen nhau tạo sự hấp dẫn, tò mò cho khách du lịch. Ngoài ra, điểm nhấn khi đặt chân đến nơi này nằm ở chính các con phố. Mỗi con phố lại được đặt tên theo nghề đặc trưng từ xưa.
Phiên chợ đêm phố cổ thường họp vào tối thứ 6, thứ 7 và chủ nhật hàng tuần, trên các phố Hàng Đào, Hàng Ngang, Hàng Đường, Hàng Khoai tới Hàng Giầy. Chợ đêm phố cổ lúc nào cũng nhộn nhịp, với nhiều mặt hàng bình dị, dân dã, cổ kính đậm chất của người Việt.

Bạn có thể đặt khách sạn ở Phố Cổ Hà Nội để tiện cho việc tham quan và du lịch. Và cũng chính nơi đây sẽ làm cho du khách thấy được nét đẹp trong tâm hồn của con người Hà Nội.
Một nơi thú vị nữa trong khu phố cổ mà các bạn không nên bỏ qua chính là “phố bia” Tạ Hiện, điểm đến ưa thích vào buổi tối không chỉ với người Hà Nội mà còn với cả các du khách nước ngoài. Khu phố này ngoài đặc sản bia cỏ nổi tiếng, nó còn hấp dẫn bởi những món ăn ngon như chim cút nướng, bánh xèo hay bún trộn… Nhâm nhi cốc bia trong buổi tối trời mát mẻ sẽ đem đến những trải nghiệm khó quên.', N'images/cho-dem-pho-co-hn.jpg', N'CD02', 1, N'Phố cổ Hà Nội và chợ đêm ', CAST(N'2020-12-24T23:11:24.373' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV21', N'admin@gmail.com', N'Hiếm nơi nào trên thế giới giữ được thiên nhiên như ở nơi đây, điểm đặc biệt của địa lí Hà Nội là trong thành phố có rất nhiều hồ, xung quanh là các con sông lớn. Và hồ được gắn với nhiều di tích lịch sử nhất chính là hồ Hoàn Kiếm, nằm ngay giữa trung tâm thủ đô với tháp Rùa cổ kính nằm trên một bán đảo nhỏ ở giữa.
Hồ Gươm ban ngày đã đẹp, vào buổi tối còn đẹp và lộng lẫy hơn. Nó là địa điểm tham quan, vui chơi buổi tối cực kỳ thú vị và lãng mạn cho các bạn trẻ cũng như du khách tìm đến.

Ngoài ra, một không gian văn hóa được mở rộng thêm cho du khách cũng như tạo nơi vui chơi cho người dân đến vào dịp cuối tuần. Khu phố đi bộ là sự kết hợp của nhiều hoạt động nghệ thuật, vui chơi giải trí nhận được sự tham gia nhiệt tình của các bạn trẻ cũng như khách nước ngoài. Sẽ rất thích hợp nếu bạn lựa chọn đặt khách sạn ở gần hồ Hoàn Kiếm để đi chơi và thưởng thức ẩm thực Hà Nội mà không ngán.', N'images/ho-hoan-kiem.jpg', N'CD02', 1, N'Hồ Gươm ', CAST(N'2020-12-24T23:12:16.573' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV22', N'lelinh@gmail.com', N'Trong thời kì Pháp thuộc vào cuối thế kỉ 19, rất nhiều nhà thờ được xây dựng. Nhưng trong số đó, công trình lớn nhất, tiêu biểu nhất phải kể đến là nhà thờ lớn Hà Nội. Quang cảnh thoáng đãng và dễ chịu khiến nơi đây là một trong những địa điểm vui chơi ở Hà Nội, thu hút của giới trẻ cũng như khách du lịch. Buổi sáng ngồi nhâm nhi cốc cafe vỉa hè, tối đến cùng tụ họp bạn bè chuyện phiếm bên ly trà chanh.', N'images/nha-tho-lon-ha-noi.jpg', N'CD02', 0, N'Nhà thờ lớn Hà Nội ', CAST(N'2020-12-24T23:16:20.817' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV23', N'lelinh@gmail.com', N'Không chỉ là chứng tích về những năm tháng oai hùng của lịch sử, cầu Long Biên hiện tại là điểm đến của rất nhiều bạn trẻ yêu chụp ảnh bởi vẻ đẹp cổ kính nhưng vẫn đầy lãng mạn của nơi đây. Bên cạnh đó xung quanh cầu Long Biên cũng còn rất nhiều những địa điểm vui chơi hấp dẫn khác mà các bạn có thể khám phá như bãi đá sông Hồng, vườn đào Nhật Tân…Các khách sạn gần Ga Long Biên là lựa chọn thích hợp để bạn có thể tham quan Cầu Long Biên cũng như nhiều địa điểm khác ở Hà Nội.
', N'images/cau-long-bien.jpg', N'CD02', 0, N'Cầu Long Biên – địa điểm đi chơi ở Hà Nội hấp dẫn giới trẻ', CAST(N'2020-12-24T23:17:48.733' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV5', N'user1@gmail.com', N'Được mệnh danh là vùng đất Cố Đô hiện nay du lịch Ninh Bình trở thành điểm đến nổi tiếng của Việt Nam. Không chỉ mỗi khách du lịch trong nước đến đây mà hàng năm còn hút cả triệu khách du lịch quốc tế đến tham quan. Mọi người khi đến Du lịch Ninh Bình đều không khỏi trầm trồ và ngỡ ngàng bởi vẻ đẹp của những danh lam thắng nổi tiếng như Chùa Bái Đính, Nhà thờ Đá Phát Diệm, Tràng An, núi Non Nước, Tam cốc – Bích động … và còn rất nhiều các địa điểm hút khách nữa.
Không giống như Du lịch Đà Nẵng phân chia 2 mùa mưa và nắng rõ rệt. Du lịch Ninh Bình bạn có thể đi quanh năm và mỗi mùa đều có những nét đẹp riêng của nó. Rất nhiều địa danh nổi tiếng của Ninh Bình khai thác du lịch được quanh năm tạo nên một Ninh Bình luôn đầy ắp du khách.

Nhưng không thể nói là lúc nào đi du lịch Ninh Bình cũng là đẹp nhất. Trong 1 năm thì Ninh Bình cũng có 2 mùa được gọi là thời điểm vàng cho khách du lịch đến tham quan. Dưới đây mình sẽ chỉ luôn cho mọi người cùng nắm rõ nhé.

+ Thời điểm Lập Xuân : Những ngày đầu năm từ tháng 1 đến tháng 3, thời tiết rất mát mẻ của những ngày đầu xuân. Thời điểm cho mọi người đi tham quan các địa điểm nổi tiếng kết hợp đi du xuân. Rất lý tưởng cho những người đi du lịch Tâm Linh như tham quan Chùa Bái Đính, Tràng An và nhà thờ Đá …

+ Thời điểm vào Hè : Những ngày hè từ tháng 4 – 6 thì phù hợp với nhiều người nhất. Những điểm du lịch Sinh Thái như Tam Cốc – Bích Động, rừng Cúc Phương, Tràng An đều đông nghịt du khách đến. Hoặc mọi người cùng trải nghiệm vẻ đẹp của những cánh đồng lúa chín rộ ở Tam cốc hay đến rừng Cúc Phương để ngắm hàng ngàn con bướm đậu kín đường. Đây là những khoảnh khắc giúp bạn có những tấm ảnh tự sướng có 1 không 2.', N'images/du-lich-ninh-binh-voi-canh-dong-lua-chin.jpg', N'CD03', 1, N'Ninh Bình đẹp lắm nha ', CAST(N'2020-12-24T22:55:16.430' AS DateTime))
INSERT [dbo].[BaiViet] ([MaBaiViet], [Email], [Noidung], [DuongDanHinhAnh], [MaChuDe], [TinhTrang], [TieuDe], [ThoiGian]) VALUES (N'BV7', N'user1@gmail.com', N'Canh chua cá chốt 
Ở Long An có một món ăn hết sức độc đáo tên là canh chua cá chốt. Làm nên hương vị ngọt ngào cho món canh chua cá chốt thì không thể thiếu nguyên liệu chính là những chú cá chốt có phần thịt thơm ngon, phần trứng bùi và béo ngậy. Trong món ăn này, ngoài cá chốt thì du khách đừng quên gọi thêm bông thiên lý ăn kèm canh chua.

Là một trong những món ăn miền Tây Nam Bộ ăn ngon “miễn chê” nên có nhiều quán ăn gia đình ở Long An có món canh chua cá chốt trong thực đơn của mình. Ngoài món canh chua cá chốt, một số quán còn bán thêm cá chốt kho và cá chốt chiên giòn… để phục vụ du khách.
Bánh tét Long An 
Bánh tét ở thị trấn Đức Hòa từ lâu đã trở thành một trong những món ăn đặc sản nổi tiếng ở Long An. Bánh tét Đức Hòa ngon bởi vì để làm được 1 phần bánh tét Đức Hòa đòi hỏi người nấu bánh phải thật tỉ mỉ từ khâu chọn nguyên liệu gạo, thịt ba rọi, đậu xanh… để nấu bánh.

Bên cạnh đó, bánh tét Long An ở thị trấn Đức Hòa còn có nhiều loại nhân đa dạng để du khách chọn lựa như nhân ngọt, nhân mặn, nhân dừa hay nhân chuối… Nếu từng một lần thưởng thức hương vị thơm ngon của món bánh tét Long An thì du khách chắc chắn sẽ muốn thưởng thức lại một lần nữa khi có dịp ghé thăm tỉnh Long An.', N'images/maxresdefault.jpg', N'CD08', 1, N'Nam bộ những món ăn không thể bỏ qua ', CAST(N'2020-12-24T22:59:07.697' AS DateTime))
GO
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'admin@gmail.com', N'BV5', CAST(N'2020-12-24T23:13:15.000' AS DateTime), N'chuẩn rồi Trang An là đẹp nhất Ninh Bình ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'admin@gmail.com', N'BV7', CAST(N'2020-12-24T23:12:55.000' AS DateTime), N'Tuỳ từng nơi nha, nên tìm nơi uy tín ấy Tớ thấy toàn đề fake á ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'duongphuongnam1@gmail.com', N'BV10', CAST(N'2020-11-03T14:38:49.200' AS DateTime), N'bạn ơi Sài gòn đẹp thiệt sự ấy, mk từng đi một lần rồi, h đang tìm cơ hội để được đi tiếp nè ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'duongphuongnam1@gmail.com', N'BV15', CAST(N'2020-12-24T07:33:30.000' AS DateTime), N'đi chơi chỗ này thức cực nè mọi người ơi ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'duongphuongnam1@gmail.com', N'BV16', CAST(N'2020-12-23T21:33:30.000' AS DateTime), N'bùi văn dương ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'lelinh@gmail.com', N'BV11', CAST(N'2020-03-23T13:02:00.000' AS DateTime), N'Mình đã từng lượn xe máy qua đây, không khí trong lành, phong cảnh hữu tình lắm mọi người ơi')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'user2@gmail.com', N'BV13', CAST(N'2020-12-24T23:08:25.000' AS DateTime), N'Đông ơi là đông, không có chỗ chen luôn hic hic ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'user2@gmail.com', N'BV5', CAST(N'2020-12-24T23:08:48.000' AS DateTime), N'Đến ninh bình thì không thể bỏ qua Tràng An nha, đẹp cực đáng để đi nha ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'user2@gmail.com', N'BV7', CAST(N'2020-12-24T23:07:39.000' AS DateTime), N'mình cực thực đồ ăn Miền Tây ')
INSERT [dbo].[BinhLuan] ([Email], [MaBaiViet], [ThoiGian], [NoiDung]) VALUES (N'user2@gmail.com', N'BV7', CAST(N'2020-12-24T23:08:06.000' AS DateTime), N'Nguyên liệu k thể thiếu trong đồ ăn miền tây là Đường nha 
')
GO
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'admin@gmail.com', N'BV18', 1, CAST(N'2020-12-24T15:00:00.000' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'admin@gmail.com', N'BV7', 1, CAST(N'2020-12-24T23:12:57.533' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'duongphuongnam1@gmail.com', N'BV04', 1, CAST(N'2020-04-29T01:00:00.000' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'duongphuongnam1@gmail.com', N'BV08', 1, CAST(N'2020-12-14T08:39:21.533' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'duongphuongnam1@gmail.com', N'BV09', 1, CAST(N'2020-04-29T01:00:00.000' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'duongphuongnam1@gmail.com', N'BV10', 0, CAST(N'2020-04-29T01:00:00.000' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'duongphuongnam1@gmail.com', N'BV15', 1, CAST(N'2020-04-29T01:00:00.000' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'duongphuongnam1@gmail.com', N'BV16', 0, CAST(N'2020-04-29T01:00:00.000' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'lelinh@gmail.com', N'BV15', 0, CAST(N'2020-12-22T16:00:00.000' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'user1@gmail.com', N'BV11', 1, CAST(N'2020-11-06T22:38:39.723' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'user1@gmail.com', N'BV13', 1, CAST(N'2020-11-09T07:28:57.333' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'user2@gmail.com', N'BV13', 0, CAST(N'2020-12-24T23:08:13.307' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'user2@gmail.com', N'BV5', 1, CAST(N'2020-12-24T23:08:51.013' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'user2@gmail.com', N'BV7', 1, CAST(N'2020-12-24T23:07:22.780' AS DateTime))
INSERT [dbo].[CamXuc] ([Email], [MaBaiViet], [Thich], [ThoiGian]) VALUES (N'user3@gmail.com', N'BV04', 1, CAST(N'2020-12-21T21:00:00.000' AS DateTime))
GO
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD00', N'Khác')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD01', N'Sapa')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD02', N'Hà Nội')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD03', N'Ninh Bình')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD04', N'Huế - Đà Nẵng - Quảng Nam')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD05', N'Nha Trang')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD06', N'Đà Lạt')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD07', N'Thành phố Hồ Chí Minh')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD08', N'Miền Tây')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CD09', N'Phú Quốc')
GO
INSERT [dbo].[images] ([name]) VALUES (N'1')
INSERT [dbo].[images] ([name]) VALUES (N'2')
INSERT [dbo].[images] ([name]) VALUES (N'3')
INSERT [dbo].[images] ([name]) VALUES (N'4')
INSERT [dbo].[images] ([name]) VALUES (N'5')
INSERT [dbo].[images] ([name]) VALUES (N'6')
INSERT [dbo].[images] ([name]) VALUES (N'7')
INSERT [dbo].[images] ([name]) VALUES (N'8')
INSERT [dbo].[images] ([name]) VALUES (N'9')
INSERT [dbo].[images] ([name]) VALUES (N'10')
INSERT [dbo].[images] ([name]) VALUES (N'11')
INSERT [dbo].[images] ([name]) VALUES (N'12')
INSERT [dbo].[images] ([name]) VALUES (N'13')
INSERT [dbo].[images] ([name]) VALUES (N'14')
INSERT [dbo].[images] ([name]) VALUES (N'15')
INSERT [dbo].[images] ([name]) VALUES (N'16')
INSERT [dbo].[images] ([name]) VALUES (N'17')
INSERT [dbo].[images] ([name]) VALUES (N'18')
INSERT [dbo].[images] ([name]) VALUES (N'19')
INSERT [dbo].[images] ([name]) VALUES (N'20')
INSERT [dbo].[images] ([name]) VALUES (N'21')
INSERT [dbo].[images] ([name]) VALUES (N'22')
INSERT [dbo].[images] ([name]) VALUES (N'23')
INSERT [dbo].[images] ([name]) VALUES (N'24')
INSERT [dbo].[images] ([name]) VALUES (N'25')
GO
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'admin@gmail.com', N'admin', N'admin', N'21232f297a57a5a743894a0e4a801fc3                                                                    ', N'images/17.jpg', N'Nam', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'duong@gmail.com', N'Bùi Văn Dương', N'admin', N'827ccb0eea8a706c4c34a16891f84e7b                                                                    ', N'images/18.jpg', N'Nữ', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'duongphuongnam1@gmail.com', N'Bùi Dương', N'Anonymous', N'2b9cdebb444dbb2fe8380860104f0573                                                                    ', N'images/19.jpg', N'Nam', N'Mị còn trẻ mị muốn đi chơi, Xách balo lên và đi thôi ', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'khanhnguyenk8@gmail.com', N'Nguyễn Thị Kim Khánh', N'admin', N'e10adc3949ba59abbe56e057f20f883e                                                                    ', N'images/20.jpg', N'Nữ', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'lelinh@gmail.com', N'Lê Thị Linh', N'admin', N'827ccb0eea8a706c4c34a16891f84e7b                                                                    ', N'images/21.jpg', N'Nam', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'nguyenanhdung@gmail.com', N'Nguyễn Anh Dũng', N'Anonymous', N'e10adc3949ba59abbe56e057f20f883e                                                                    ', N'images/22.jpg', N'Nam', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'user1@gmail.com', N'Trần Văn An', N'Anonymous', N'827ccb0eea8a706c4c34a16891f84e7b                                                                    ', N'images/23.jpg', N'Nữ', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'user2@gmail.com', N'Nguyễn Huy Hoàng', N'Anonymous', N'827ccb0eea8a706c4c34a16891f84e7b                                                                    ', N'images/24.jpg', N'Nam', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
INSERT [dbo].[NguoiDung] ([Email], [HoTen], [QuyenAdmin], [MatKhau], [AnhDaiDien], [GioiTinh], [MoTa], [ThoiGian]) VALUES (N'user3@gmail.com', N'Nguyễn Khánh Nguyên', N'Anonymous', N'202cb962ac59075b964b07152d234b70                                                                    ', N'images/25.jpg', N'Nam', N'Thích du lịch :))))', CAST(N'2020-01-29T01:00:00.000' AS DateTime))
GO
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'a', N'Bùi Dương', N'aaaa', CAST(N'2020-12-23T22:47:21.803' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'a', N'a', N'a', CAST(N'2020-12-23T22:47:26.177' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'a', N'Bùi Dương', N'a', CAST(N'2020-12-24T09:37:18.327' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'a@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-12-23T22:47:12.563' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'admin@gmail.com', N'a', N'a', CAST(N'2020-12-23T22:47:31.420' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'admin@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-12-24T20:35:46.467' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'admin@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-12-24T20:35:55.327' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'admin@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-12-24T20:35:58.480' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'admin@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-12-24T20:36:08.887' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'admin@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-12-24T20:36:11.470' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'admin@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-12-24T20:36:31.077' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'duo@gmail.com', N'Bùi Dương', N'aaaa', CAST(N'2020-11-01T22:26:57.757' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'fake@gmail.com', N'Phạm Thị Hải Yến', N'Tôi thích diễn đàn này. mong diễn đàn ngày càng phát triển', CAST(N'2020-02-03T04:00:00.000' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'hacker@gmail.com', N'Nguyễn Thị Hoa', N'Trang web cần cải thiện gioa diện người dùng, thuận tiện hơn cho người dùng', CAST(N'2020-03-03T06:00:00.000' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'kim@gmail.com', N'Nguyễn Khánh Nguyên', N'Màu sắc hài hòa đẹp mắt nè', CAST(N'2020-08-15T09:00:00.000' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'nam1@gmail', N'Bùi Dương', N'aaaa', CAST(N'2020-12-23T22:48:13.717' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'null@gmail.com', N'Nguyễn Thị Mai Chi', N'Diễn đàn có ích cho mọi người. Cảm ơn team đã tạo ra diễn đàn', CAST(N'2020-03-05T07:00:00.000' AS DateTime))
INSERT [dbo].[PhanHoi] ([Email], [HoTen], [NoiDung], [ThoiGian]) VALUES (N'user1@gmail.com', N'Trần Văn An', N'Sao bài đăng của tôi duyệt lâu thế?', CAST(N'2020-02-13T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[NguoiDung] ([Email])
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDe] ([MaChuDe])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[NguoiDung] ([Email])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaBaiViet])
REFERENCES [dbo].[BaiViet] ([MaBaiViet])
GO
ALTER TABLE [dbo].[CamXuc]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[NguoiDung] ([Email])
GO
ALTER TABLE [dbo].[CamXuc]  WITH CHECK ADD FOREIGN KEY([MaBaiViet])
REFERENCES [dbo].[BaiViet] ([MaBaiViet])
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD CHECK  (([TinhTrang]='0' OR [TinhTrang]='1'))
GO
ALTER TABLE [dbo].[CamXuc]  WITH CHECK ADD CHECK  (([Thich]='0' OR [Thich]='1'))
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD CHECK  (([GioiTinh]=N'Nam' OR [GioiTinh]=N'Nữ'))
GO
USE [master]
GO
ALTER DATABASE [ForumsDuLich] SET  READ_WRITE 
GO
/****** Object:  Trigger [dbo].[DTG_XoaNguoiDung]    Script Date: 12/24/2020 3:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[DTG_XoaNguoiDung] on [dbo].[NguoiDung] instead of delete
as
begin
  declare @_email varchar(50)
  select @_email  = Email 
  from deleted
  update BaiViet set Email = 'khanhnguyenk8@gmail.com'  where Email = @_email
  delete CamXuc where Email = @_email 
  delete BinhLuan where Email = @_email
  begin
  delete NguoiDung where Email = @_email
  end
end

GO
/****** Object:  Trigger [dbo].[DTG_XOABAIVIET]    Script Date: 12/24/2020 3:53:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[DTG_XOABAIVIET] on [dbo].[BaiViet] instead of delete
as
begin
  declare @MaBaiViet varchar(50)
  select @MaBaiViet = MaBaiViet 
  from deleted
  delete CamXuc where MaBaiViet = @MaBaiViet
  delete BinhLuan where MaBaiViet = @MaBaiViet
  delete BaiViet where MaBaiViet = @MaBaiViet  
end
