Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C263B7
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDmoQ3LfDeqFs0l+P3FAwU4U2JhaZaDcT6uw8xqwWvaIDGW+aoCcoht7SO0auThuM3tJQqy9rLm46Z7bjVxVF846mHMeHezQR0pIUvXHMJ2MVsFqy2YnT38NvhyuTewQZmt6BJFjXmWc6NrGzf2RbP0lZrkSSNQjgvzZqN66LmNdSTJaktfm+Z9ha9OlxTxV3WvEXBcEbJZlz31K0SQowJL5uq7nayiuhIBjrjLTImyieH5WyM4Oehg6miprcpS4+XdpGxv3yf3zqvcE9vL1uo8KuRUIhZngZObR52UVf/WfW5gQTQW5Nx67YBiB4iUCBNaJ3dMxzzHOb+W5wp3eYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jcl42L3FloEax58T988/vqZBnqDNnqpkHemK2a54Yo=;
 b=avajnaRxGT49pJPqXOqhEZ1CqNqDcOGcI7NkhD04kw/Qqfdzp9tAhe9PfUmpaQnGcUpBibyk/3BkwL1sFYezIQSjWeGm/YP+jpCQkrqw8H9zy+no3ONCn9dgsxo8fMFtxvUPpa/D+ulMMHcuLHhQhcMGft2hKuIXYreYvtpGZ1sQIHIjTd7vUVrtRs27RcX/nERbVq7J6HTxPKxUMVhF26qJjdzEAMtrgKQwPj/WwDRgXuD6XQlx8vSdDrbe1zC+ErT7sbdwcMjxeFGCXE/swBXPuB3NzGoZoE7cWMHbqPcRIga9/ZZ8TxnRZsl6ca7AB7kmVDq+pyU9J5WNbIRmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jcl42L3FloEax58T988/vqZBnqDNnqpkHemK2a54Yo=;
 b=JcrYYfKmuT+wfh/rgMiqvP0seZrFKc2LMPwAecw9a4XNlYg/D3iltYWGsKkUhJkTDqO0U5trC/ugF9JrDj0uxTIJ4IxaoNDDBB2nSIlk00U+9CbGtCk60wJ8qe4rRSm1raPA0K7yEtn0HJn0noaLoubY6fYwAwbNeqHDiLceYLeVjj8rwgEAE8HRQWUMFz2leHzLSOMV/KSGcvcoCGuMpmFMv/VKUne9/2jGgCKoEK2LpSwuaJrwqNNeW8M6zmt8Phlv6dj6bBxi/FT85OSJ6zZaE/5W6EeRLu4+lr/JROxo1o+TWez6dFZEN/q8Ekd1UXe42xo882fj/ZWrc7Mpzw==
Received: from MW4PR03CA0273.namprd03.prod.outlook.com (2603:10b6:303:b5::8)
 by MN0PR12MB5954.namprd12.prod.outlook.com (2603:10b6:208:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 17:47:09 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::4c) by MW4PR03CA0273.outlook.office365.com
 (2603:10b6:303:b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 10:46:58 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 10:46:57 -0700
Received: from dipenp.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 3 Nov 2022 10:46:57 -0700
From: Dipen Patel <dipenp@nvidia.com>
To: <timestamp@lists.linux.dev>
CC: Dipen Patel <dipenp@nvidia.com>
Subject: [PATCH 6/7] arm64: tegra: Enable GTE nodes
Date: Thu, 3 Nov 2022 10:46:52 -0700
Message-ID: <20221103174653.29765-7-dipenp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|MN0PR12MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cca51b3-7304-464d-07ff-08dabdc36e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	km/KFKNJBWqIt03FCtHOQMXT3YdZkOm2ij1MXsU41aXEbB3heUXdZtKxqPL+QbDpRn9MQcEFkR2MTn93ohutwdqRW1AD3s5i6b6ycvjhCaAOgZVpR1yUOoyL5OGAGpnJbBwi5A1A/KfrENB3iz2mVerAma+ANZk57SOmRxa01MWP5g9H56KuUTE9kWyr/Rdgaw3jg1lNlqEBb8kFRt2bIsbVhB38UfLwb7Xw4C3/Juk1787dYMt80GurO0K26c/l8u1YbkVTGEZJ0ommdvaEsEXA785vla02okN5mljLJXqaFlhcWnRNIvAWAjdPjggTFmkGZXGVUlKRmusq6usqVeiOHCVC78vatWsjJjLqqV0ZQRN1d5RsXj2SmcAZqkzYRVeIm3fT/pAT5EXp79UDPhyzU1LiYnholKtR20+cINLrjaLDkLEAQqqY6YUlk2jRmHsQY1xWlCE6lehrmTJZLwdFZvZZaL354nDoCqcNE/qtvEQHEQ2J6YtV9OGd9aNrqs3vG8HDGfQfUfJftoBz2FZPSKp9hlWupHjWTjEoiCg2GA8Ndto6Tq94ME9G0qu1965Pu30XfGWK+E58jxq+MayF90m5eliCc37O18zz5Fz/MoVHvYZJ8wER/nukPvoDbyWIMCnSWWtkM6RG91qfOXWS+uTXKm96mC+F76f/qzpHWQ04eunDab88qnIFjy4lMjY5mC6uNONoGEezgRluUQrB7kvFZtBVADdXorUc3ZQpcmC2t/gLkpVLXcqePW4kfR8BLmo/1oFzX1JcNSBYAw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(40460700003)(356005)(2906002)(316002)(70206006)(6916009)(7636003)(41300700001)(8936002)(5660300002)(47076005)(8676002)(40480700001)(4326008)(26005)(336012)(1076003)(186003)(70586007)(36860700001)(83380400001)(86362001)(426003)(2616005)(82740400003)(478600001)(107886003)(7696005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:08.7832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cca51b3-7304-464d-07ff-08dabdc36e0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5954

Add and enable AON and LIC GTE nodes by default.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 41f3a7e188d0..67927d97956e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1366,6 +1366,16 @@
 			status = "disabled";
 		};
 
+                hte_lic: hardware-timestamp@3aa0000 {
+                        compatible = "nvidia,tegra194-gte-lic";
+                        reg = <0x3aa0000 0x10000>;
+                        interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+                        nvidia,int-threshold = <1>;
+                        nvidia,slices = <11>;
+                        #timestamp-cells = <1>;
+                        status = "okay";
+                };
+
 		hsp_top0: hsp@3c00000 {
 			compatible = "nvidia,tegra194-hsp";
 			reg = <0x03c00000 0xa0000>;
@@ -1579,6 +1589,16 @@
 			#mbox-cells = <2>;
 		};
 
+                hte_aon: hardware-timestamp@c1e0000 {
+                        compatible = "nvidia,tegra194-gte-aon";
+                        reg = <0xc1e0000 0x10000>;
+                        interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+                        nvidia,int-threshold = <1>;
+                        nvidia,slices = <3>;
+                        #timestamp-cells = <1>;
+                        status = "okay";
+                };
+
 		gen2_i2c: i2c@c240000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x0c240000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 0170bfa8a467..fecf9ab1bf17 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -949,6 +949,16 @@
 			clock-names = "fuse";
 		};
 
+                hte_lic: hardware-timestamp@3aa0000 {
+                        compatible = "nvidia,tegra234-gte-lic";
+                        reg = <0x3aa0000 0x10000>;
+                        interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+                        nvidia,int-threshold = <1>;
+                        nvidia,slices = <17>;
+                        #timestamp-cells = <1>;
+                        status = "okay";
+                };
+
 		hsp_top0: hsp@3c00000 {
 			compatible = "nvidia,tegra234-hsp", "nvidia,tegra194-hsp";
 			reg = <0x03c00000 0xa0000>;
@@ -1466,6 +1476,16 @@
 			#mbox-cells = <2>;
 		};
 
+                hte_aon: hardware-timestamp@c1e0000 {
+                        compatible = "nvidia,tegra234-gte-aon";
+                        reg = <0xc1e0000 0x10000>;
+                        interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+                        nvidia,int-threshold = <1>;
+                        nvidia,slices = <3>;
+                        #timestamp-cells = <1>;
+                        status = "okay";
+                };
+
 		gen2_i2c: i2c@c240000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0xc240000 0x100>;
-- 
2.17.1

