Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0CA63B5
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbBOurDFLexDcEZeNzPw6EvYfJ8wJIwraOMdv3/Z4+k3hkbkpbtfCCZ4p7zaUOk1d+tE8uLLgoFccT/V9rQnGnTbNeXQA5bfSjbfUF0tGMogvgabibAGz2GaN1ZP/5zj+MSnuBvHwiGz9q8wsgkuQBJm5Lz2h3KNDeHwwSAA60Ph91ZuB/e5emQ5frLkItKtT+kDZYMKBO7Io3IqGM5wbR497a+9D3t2h0+qwWMwfINvlU2+8gDBkr0IzUg0sb3fnDAzVO6SYwv6bGU6JEju/JAjSDWUAnzeNOPLg8dHeO4qafKiUywUwn8WZqKF/ovZktIyMliXXBaPnSB+Ln2PxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pstXmg6urw7LmGRYp+ddqAdzwMYZNxqun98oEwstrbo=;
 b=TcDHCAWPBVtP8DoMuPjpjxnlCH42bDRZKbXerzpfpvYlQ0Nolu3G7EofmdhmSM97aRhdxgJPxVeEjzVdBT+BXWdWg0AeSv8KEy4XuGsSh4wr1x05/kGB8xsFhOBoaEJ8VtD2Jpv5hhfIqI4M7DxU9nasUVA29iN1kKb6JYSa3IC6CzQMZeLx69TeHmsTCsHiYyi8PoB0hoS4ZutwbrMKvyF310wR3NEhgJC3QdW4bztqT74hmROI0jBBSi6uf9iZdZB6N/NdIkZrWGw967pew5tkKzW/KA6PFAMQMIfcd8zUD36isJR8T9ZISkEPLCEzQj2Emf47LcnIuyoPx022Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pstXmg6urw7LmGRYp+ddqAdzwMYZNxqun98oEwstrbo=;
 b=DXxGoPhHaC/t+FXQqzt2WPxSbc2CWhN+Rym/rc1uDMooZI+Bg7yLiHNujyFzCw2/1Je7VwYKqN15DzEgKuQZWzekiOT/KpUGyyBnzWpQEep2qfg1YEDoGiGzMYXZ+26Hv+sWT24Co9wOLWpy1fzox4demFnxrXESungGoPcxVZls6Ys76UjSXk7pjnXpb/QrQzPwKGaCoQ1WvKFnouaLb6VDrOBPLv+trMgsPqoaO7LhJwkHuMoPmOqxZiianem0JJHL4eyAEe3wHaDRAQzV3Ggi/AJWjx06FzhJJ1pvHxyENaJwIDpnBm12h5bJ0uwgzskR8NbyYLsFJYF2f/Gt5Q==
Received: from BN9PR03CA0055.namprd03.prod.outlook.com (2603:10b6:408:fb::30)
 by BL1PR12MB5205.namprd12.prod.outlook.com (2603:10b6:208:308::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 17:47:08 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::67) by BN9PR03CA0055.outlook.office365.com
 (2603:10b6:408:fb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 10:46:57 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 10:46:56 -0700
Received: from dipenp.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 3 Nov 2022 10:46:56 -0700
From: Dipen Patel <dipenp@nvidia.com>
To: <timestamp@lists.linux.dev>
CC: Dipen Patel <dipenp@nvidia.com>
Subject: [PATCH 2/7] hte: Add Tegra234 provider
Date: Thu, 3 Nov 2022 10:46:48 -0700
Message-ID: <20221103174653.29765-3-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221103174653.29765-1-dipenp@nvidia.com>
References: <20221103174653.29765-1-dipenp@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|BL1PR12MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 182219ab-90ce-4551-5f22-08dabdc36db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QLqbEiWHo9lNFMV0TdPbi5cdTO4CrElDMGulGyupK7dfMQffUBbOkSEi7TlKx5wBbLIFkXHaJHUcJBHKw7Tq+R3YlzbvVg2TFLWJp+/Ssy5dM99zK6RWbAjfFNy+GvufA+OLZerw+QC9vla/mMT5C1CK9U7Oyz0RNwT6f7i3V8gn6bzS7jV/jiOomvWfCtLUimCirbjJCdsOXqlPVqW+ZBbStwQ9gwizzIYD3sfGt91WUuprDBAwFJmNMJzIaKJ65MqXq9nTcrFFnbW+vRYbhUhsFmVwsNhkPQACQedjLLUVCzS0Cdda1R54Yo3C3lEDxzU89dQbaVGOZNH2fYp2zdbcsjDEYo/nZE8DWpcfuv+UjDtljxLGkiM5CqysUr/sGO1jiL/RWMvWdNjmIaAygLC/LDPEh3mlyDh2NwrLbvTWWfa+UHU3GGK9oUoyg7AIYaXjGHCMZ8pQ7xn3Ddbuv+L+z7OBPFP8diBkgdg2PEuI89n2isxaPb770S6DBV+6yuVXQKoJ+qMT9654NcHax09tNiak1WznLMO4xmrBX27ZbBdtldTKtCE06tIsQ++uRZX3sS9dlIp6lVWHQfXWIIMWrWchvpowPFGOo1DXWQeB8ly6+xUVvHdFddgAvOYHTJWw2UQk34zp+ozvW13Xn9rSiX8napNrlGikzTiDXoL+S+ZftgHn7oHFB5P0MQquQ8f+VfayTUgtMN5NB0E7Fq5Tsgms8tO398HJOyKLDqAuMKe1eTdt5JzCnviWI5PUoKwb4XZCgNXLbgZmgO25wg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(336012)(2616005)(186003)(41300700001)(36756003)(47076005)(8936002)(7636003)(5660300002)(316002)(356005)(70206006)(40460700003)(7696005)(1076003)(426003)(478600001)(107886003)(6666004)(26005)(4326008)(70586007)(8676002)(82740400003)(40480700001)(6916009)(82310400005)(86362001)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:08.1150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 182219ab-90ce-4551-5f22-08dabdc36db2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5205

The Tegra234 AON GPIO instance and LIC IRQ support HTE. For the GPIO
HTE support, it requires to add mapping between GPIO and HTE framework.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/hte/hte-tegra194-test.c |   2 +-
 drivers/hte/hte-tegra194.c      | 124 ++++++++++++++++++++++++++++++--
 2 files changed, 121 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index 5d776a185bd6..d79c28a80517 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -16,7 +16,7 @@
 #include <linux/hte.h>
 
 /*
- * This sample HTE GPIO test driver demonstrates HTE API usage by enabling
+ * This sample HTE test driver demonstrates HTE API usage by enabling
  * hardware timestamp on gpio_in and specified LIC IRQ lines.
  *
  * Note: gpio_out and gpio_in need to be shorted externally in order for this
diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 49a27af22742..5d1f947db0f6 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -62,6 +62,10 @@
 #define NV_AON_HTE_SLICE2_IRQ_GPIO_25	25
 #define NV_AON_HTE_SLICE2_IRQ_GPIO_26	26
 #define NV_AON_HTE_SLICE2_IRQ_GPIO_27	27
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_28	28
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_29	29
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_30	30
+#define NV_AON_HTE_SLICE2_IRQ_GPIO_31	31
 
 #define HTE_TECTRL		0x0
 #define HTE_TETSCH		0x4
@@ -220,7 +224,100 @@ static const struct tegra_hte_line_mapped tegra194_aon_gpio_sec_map[] = {
 	[39] = {NV_AON_SLICE_INVALID, 0},
 };
 
-static const struct tegra_hte_data aon_hte = {
+static const struct tegra_hte_line_mapped tegra234_aon_gpio_map[] = {
+	/* gpio, slice, bit_index */
+	/* AA port */
+	[0]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
+	[1]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
+	[2]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
+	[3]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
+	[4]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
+	[5]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
+	[6]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
+	[7]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
+	/* BB port */
+	[8]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
+	[9]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
+	[10] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
+	[11] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
+	/* CC port */
+	[12] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
+	[13] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
+	[14] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
+	[15] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
+	[16] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
+	[17] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
+	[18] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
+	[19] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
+	/* DD port */
+	[20] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
+	[21] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
+	[22] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
+	/* EE port */
+	[23] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_31},
+	[24] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_30},
+	[25] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
+	[26] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
+	[27] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[28] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[29] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[30] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	/* GG port */
+	[31] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+};
+
+static const struct tegra_hte_line_mapped tegra234_aon_gpio_sec_map[] = {
+	/* gpio, slice, bit_index */
+	/* AA port */
+	[0]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
+	[1]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
+	[2]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
+	[3]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
+	[4]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
+	[5]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
+	[6]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
+	[7]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
+	/* BB port */
+	[8]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
+	[9]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
+	[10] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
+	[11] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
+	[12] = {NV_AON_SLICE_INVALID, 0},
+	[13] = {NV_AON_SLICE_INVALID, 0},
+	[14] = {NV_AON_SLICE_INVALID, 0},
+	[15] = {NV_AON_SLICE_INVALID, 0},
+	/* CC port */
+	[16] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
+	[17] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
+	[18] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
+	[19] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
+	[20] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
+	[21] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
+	[22] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
+	[23] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
+	/* DD port */
+	[24] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
+	[25] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
+	[26] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
+	[27] = {NV_AON_SLICE_INVALID, 0},
+	[28] = {NV_AON_SLICE_INVALID, 0},
+	[29] = {NV_AON_SLICE_INVALID, 0},
+	[30] = {NV_AON_SLICE_INVALID, 0},
+	[31] = {NV_AON_SLICE_INVALID, 0},
+	/* EE port */
+	[32] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_31},
+	[33] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_30},
+	[34] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
+	[35] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
+	[36] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[37] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[38] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[39] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	/* GG port */
+	[40] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+};
+
+static const struct tegra_hte_data t194_aon_hte = {
 	.map_sz = ARRAY_SIZE(tegra194_aon_gpio_map),
 	.map = tegra194_aon_gpio_map,
 	.sec_map_sz = ARRAY_SIZE(tegra194_aon_gpio_sec_map),
@@ -228,6 +325,14 @@ static const struct tegra_hte_data aon_hte = {
 	.type = HTE_TEGRA_TYPE_GPIO,
 };
 
+static const struct tegra_hte_data t234_aon_hte = {
+	.map_sz = ARRAY_SIZE(tegra234_aon_gpio_map),
+	.map = tegra234_aon_gpio_map,
+	.sec_map_sz = ARRAY_SIZE(tegra234_aon_gpio_sec_map),
+	.sec_map = tegra234_aon_gpio_sec_map,
+	.type = HTE_TEGRA_TYPE_GPIO,
+};
+
 static const struct tegra_hte_data lic_hte = {
 	.map_sz = 0,
 	.map = NULL,
@@ -535,7 +640,9 @@ static bool tegra_hte_match_from_linedata(const struct hte_chip *chip,
 
 static const struct of_device_id tegra_hte_of_match[] = {
 	{ .compatible = "nvidia,tegra194-gte-lic", .data = &lic_hte},
-	{ .compatible = "nvidia,tegra194-gte-aon", .data = &aon_hte},
+	{ .compatible = "nvidia,tegra194-gte-aon", .data = &t194_aon_hte},
+	{ .compatible = "nvidia,tegra234-gte-lic", .data = &lic_hte},
+	{ .compatible = "nvidia,tegra234-gte-aon", .data = &t234_aon_hte},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
@@ -635,8 +742,17 @@ static int tegra_hte_probe(struct platform_device *pdev)
 
 		gc->match_from_linedata = tegra_hte_match_from_linedata;
 
-		hte_dev->c = gpiochip_find("tegra194-gpio-aon",
-					   tegra_get_gpiochip_from_name);
+		if (of_device_is_compatible(dev->of_node,
+					    "nvidia,tegra194-gte-aon"))
+			hte_dev->c = gpiochip_find("tegra194-gpio-aon",
+						tegra_get_gpiochip_from_name);
+		else if (of_device_is_compatible(dev->of_node,
+						 "nvidia,tegra234-gte-aon"))
+			hte_dev->c = gpiochip_find("tegra234-gpio-aon",
+						tegra_get_gpiochip_from_name);
+		else
+			return -ENODEV;
+
 		if (!hte_dev->c)
 			return dev_err_probe(dev, -EPROBE_DEFER,
 					     "wait for gpio controller\n");
-- 
2.17.1

