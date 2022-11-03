Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7163B4
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naqcIaKOJIjBRpveBCTO4gjgWA6IDX6hxAhbzb5XOB6JI2sf+sFrRmBICl4/15Wr40pMSUtOQla0ESDSCd0SL4cjUIgiQTgz7TTxX+OpkLrHlTlDU8GpQZ4XmPgnZ7NpZ6m7PkVfGoKErQ2+aj5TVmt6UYko6yioK8z2toyKWogQWfj2B+lce0sLAkT44Q2rOxUcyVsttacfW1Zgvp5Orwbvga6UO3faQv2DkQhvPnQYpy0SzYuMJ5xUrMarKvTWTvk5/KOlqJDw9mmiZW+BTmArUeTBq4Wn+OCYU2xUbxu6rN9mlC6BM2KdoU++I/C9r9ds05bCcUq89UyJkCnwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cppyvgqds94o3k9iW6NBlfmhi6W+iWWhvb03akvEwUY=;
 b=N+VydzXbldgNxxNUIfQKqqDnTe/JFi53n34CRUt8+TspaXC5vFGB+raXCSVWtP2YR3IIMdQEGa9QDZOtePCApUyZEWI0uLJl+Ag39Hi+vJ5i3WtyOpBEHn68/riJocGdTHvodSFDL/53IHTyivwC226T9UoYJp1GuPt81R0Wd6TOyU1eJC5nckqwnF4SwMLsj1jLk0drcWiT95Ug0szv3CjlLepYA+edhK+Zqvfv3Pwbmus9dhKAJ2booLloiYZvAjk0hrqGrc5rULhZXlFNRTUKxmRYevt4hWrfDg6iR9jx8SaMitA0nbGXZMnQUI8yBtzvkhNjzNHyV+9/0+4gVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cppyvgqds94o3k9iW6NBlfmhi6W+iWWhvb03akvEwUY=;
 b=iHrrwoSHQc0NQWBDYnZ/PoiGyXiY8VV5KsLtNASKV2NKvC5jmHNFAan7+COoIzHzaVTJUER9Y+zliJBfQexqj7cWd6GAH6hpZgQmPiMZfSlTBYtRKebL7HqQPYoROenbRfrXGva8y13jIGtYrMvR0HwHKxLJs6IsU5Oneg9TJpXtpMlrOa+Wu8aYKT7/QueBUsLE/YCDVkHjuRRakJM31DvtFs5HdOmyPuOUIY8l/si3bfIG5bAjjoh8TR1sWxxX4Y1CqfES6Jye1qG9wwlKZc38543/Cbrw03ksgKP/XzOuuasUVO/dumqGvamtXlIPlLkI3XE6ttmQs+OYav89Wg==
Received: from BN9PR03CA0096.namprd03.prod.outlook.com (2603:10b6:408:fd::11)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Thu, 3 Nov
 2022 17:47:08 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::9d) by BN9PR03CA0096.outlook.office365.com
 (2603:10b6:408:fd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 10:46:57 -0700
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
Subject: [PATCH 4/7] dt-bindings: timestamp: Add Tegra234 support
Date: Thu, 3 Nov 2022 10:46:50 -0700
Message-ID: <20221103174653.29765-5-dipenp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb05a06-d94f-4b3c-0680-08dabdc36ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k0WY+Ycrlo7jgxcibL9znbFMZ5E3AugfSFXoA7X/051CQvQvFqV4g0+jyKOJpjEEXY875Y62NXN0+3GAS2RA1p2f4OAzvTnRp4DcONAyxe9fiuGa2WNM5EveLrkqQSduca455fF9e+5JaKhpswEO8Q1h6njyXCkTmYArsIPVvZQFAYFqcbMBmELNrSZ1t/3FYXljvm2rrrJAPscfmy5zW7iPsWEyzzF9gGk6B4hnZGzHdjU8s83YjySgk818xXKlO2H042kzdJYFY0K15iO+hXwq+dHvZt52l/j3sIkyMYUHvIqMX0bERt30crph6yXoWrsnKoPlhcTkHVm+cYvmVlRCj4Z/Dzj6N60Y9obPf0y1I7kQtyHU9CMXv0LfbCI2Vzm1XYnMGjewuwQmJRonRiglFLcF69b33I20PRjILKUAcMhhSDeF4fOIzEEnTXPtLkJNg7wYJ/zlZxjlSIcx/I/QmLHDc84A3BbiOZieT4RZSkisYQdHAAFiHvpmy9QIl9Uwv1Ni+0DS7jKx5Ts8dbPSi5SYIs/lDcaVluDCat8w8c1qrfpn2YXrPA+Lkqdf9YOANErAVDEKIVJUkvGxdxyJZhuIN6Dprg3Q1xZs7j3WUcrlKbvYcV/SAzKqSqRIDaCg7fSUkAALHr25Op+i2fBqe0PAMkZcSR/ucolXO9tzURYNfOQz223245MkTPmtFu5mGDqmmR9K/E1pxisAZX9N7nZszN9Wj5AAquqzBp7M/D8/uNiJkVp9S4BJCIwLpnoNf9LUuKkIu7r363kvSeSffPasTECzVY5cwIXzfGX1I7iCnAkt/2lJw/msehYtaTbbIvOrvx8nP1+5jTfH5gRv64FZ04Kp31sU9HuoLbKTMplaabYVA+MB/Q6O1i6PoK3jQZjjkU75z2z3gaWMAA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(966005)(107886003)(8936002)(7636003)(356005)(6666004)(86362001)(478600001)(5660300002)(83380400001)(4326008)(70586007)(40480700001)(6916009)(8676002)(26005)(47076005)(426003)(316002)(2616005)(7696005)(336012)(70206006)(186003)(40460700003)(41300700001)(1076003)(36860700001)(2906002)(36756003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:08.4076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb05a06-d94f-4b3c-0680-08dabdc36ddf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189

Added timestamp provider support for the Tegra234 in devicetree
bindings.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 .../timestamp/nvidia,tegra194-hte.yaml        | 44 +++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
index c31e207d1652..158dbe58c49f 100644
--- a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
+++ b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/timestamp/nvidia,tegra194-hte.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Tegra194 on chip generic hardware timestamping engine (HTE)
+title: Tegra on chip generic hardware timestamping engine (HTE) provider
 
 maintainers:
   - Dipen Patel <dipenp@nvidia.com>
@@ -23,6 +23,8 @@ properties:
     enum:
       - nvidia,tegra194-gte-aon
       - nvidia,tegra194-gte-lic
+      - nvidia,tegra234-gte-aon
+      - nvidia,tegra234-gte-lic
 
   reg:
     maxItems: 1
@@ -43,9 +45,8 @@ properties:
     description:
       HTE lines are arranged in 32 bit slice where each bit represents different
       line/signal that it can enable/configure for the timestamp. It is u32
-      property and depends on the HTE instance in the chip. The value 3 is for
-      GPIO GTE and 11 for IRQ GTE.
-    enum: [3, 11]
+      property and the value depends on the HTE instance in the chip.
+    enum: [3, 11, 17]
 
   '#timestamp-cells':
     description:
@@ -55,6 +56,41 @@ properties:
       mentioned in the nvidia GPIO device tree binding document.
     const: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-gte-aon
+              - nvidia,tegra234-gte-aon
+    then:
+      properties:
+        nvidia,slices:
+          const: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-gte-lic
+    then:
+      properties:
+        nvidia,slices:
+          const: 11
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra234-gte-lic
+    then:
+      properties:
+        nvidia,slices:
+          const: 17
+
 required:
   - compatible
   - reg
-- 
2.17.1

