Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334EE63B3
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U32TZ0q5UFO6eCVy9duuYXtynbbOYWr1ifBP88g1khGcqyyNd+3Jyz0tJjrLtB88zXP2ggBQkj9sSFAd3wIDu+HtVcy4Lb7k3IXQ09IWPbiIwIKH81pGjWzkjjXUk2CRtGzn5z1eYWHPQYCrDNs+GesdlGoRjfDt/x+zL8SXQjbqXu5jVh+5A9ZfRSh4QUbO3TzbINOzNXVbtllvm7Oo8aYUHSUhsgUj3+N4x9ZwY3LaTbd1lSMPHuqPi0wVxRGkVIC28Ba6lw3ryxcHc9rUelgb746pLfcN4BSpFhczGu9PBKaMPbCl2+aoDU55SC3QwlRmvjQeGp3RMzEVh8mn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFMcM6zkYTuVUd1a/CBtfjvHFg7ShWtG0G/3juEsix8=;
 b=glH1Rp3rBgW87q6ml4h5SeXxMLchftiV4LvuQ3s1NCrY/HNvl5IrdB2aaJ75eBXkNTdhzDMzdfvT6/eBLUijWCMkrQmQaiJBwdOIy6papcExwHxZPv+t9w9pZGu4iujc2hkhmbjBmVQrcXcVESnGvBbTCTBmcwhlkLQZI/j4YRclyycolP91oaSoOBR0xE97DcqK5a+oDy3noOW2xbu7+V7t0J9XwqbXTLIpYmG+3uyBmOF9TR3PGWMkxU3cXGMWeWe+u03haS6N7+PuvGxZXoPM6hFMlmGgZC+kxUx+hqbgIhGHLDps5H8zFYiytcnD48rVCu+mUj00vntdHnhq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFMcM6zkYTuVUd1a/CBtfjvHFg7ShWtG0G/3juEsix8=;
 b=EXyf0gexnHwDispMqhV3E1FOjzAGC7r3OcR+9VM0FT8oLP+VIj+l+2E9If4UhsDNvQjv1RJQ5G2pobHeMUbLKVjjEZkRM9MZNYdd+WLom/MNnjOlhuHPo/VbeB81v9zbyUC3peBVv/PTx1pwed6bQRD7udfQRauQ1zc37JxJc9CqN0Gn93eLz2ORhc7iq0xAWWNtsoAbaov/sGXzY7BTi1AYoVpjvLpswLUUIOyhahX0WKe9xJJEIWaHjF437DfuUcQD0hAbKe9c1hibCi6VFYLx39fVytq6gVbB2pKbe/U/2TkH10XHgANvlr0KK78Se8LZ3/jOdAcmKtqv3gA3Fg==
Received: from BN9PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:fb::33)
 by SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 17:47:07 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::9e) by BN9PR03CA0058.outlook.office365.com
 (2603:10b6:408:fb::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 10:46:56 -0700
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
Subject: [PATCH 0/7] Add Tegra234 HTE support
Date: Thu, 3 Nov 2022 10:46:46 -0700
Message-ID: <20221103174653.29765-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 826f1ec0-e499-447f-2b9f-08dabdc36d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ptU3eoCta8zYZKSDCbzSYsM9AUMkfWYj0dmvRZwgiHT8hc3zgFRL9Cr0msn0bJyiOcRGuJBiHUKs4rcZZz4if34cueECVthW2Z7UfYqmDT67lWDLTEK0IdIRSLY+4iN42mQcDvnInjyoqhkVa2eBU3B8nyadGVT2CNAXQ1YlWIVy/eOxXNg7KmVrku7lNkjEYsj7QRdp63C07TDhil5doFXxQ/t/qjLbE3YUwfDGbVvmgqKjJz64Wz3liXqUm5hQZO8LAZXVdvG2tRMgpJ8r56MJJwDSqm4eR1hzWOh5vBPIQhO+6a3RkFoHAGy/xiItAeVBSngta+y7m4FULdb/nUgjL5aduTjozOlRmUUnTLGJib1AD6udRZWas0cXkyyYtRIJJSQPZuWaWBp5tuZ/zRKOVtwYD1f4rLtdXiG76Ab4ZJ1F/y9O2dc10IdW4FS4qGkcuQj1IXH6fahjijV+ari7Pjf4NdhfTYTGKno6By1kntJMCJn8x/oi2j8VZ0O7gFPCH751r7eHcIGE3r9Dw/M9yPTy0O3vGqsTn713GywHmYzi7at6hkJIc23sqytouexKE7GMDqz9J5N5G5kNMhtp8IeA0ezVv0D76Uu886tpjVti2GkpX7+RMshLTQsUE2K1U5iaaQGsh/PDztJfKHDsVA1PycUnZwphvhbiiaovTJMvrsVV1oPJDG9fdt0Rdt1NqjexWwkT7eCp2gnMgWNcjK5lOOOy1vfsy64LSbq5UqJekbtEJsopHOFcroDMPzUXWePKGaqvFGLo4tS/5Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(186003)(1076003)(40480700001)(478600001)(2906002)(47076005)(426003)(8936002)(316002)(7696005)(107886003)(2616005)(83380400001)(336012)(82310400005)(70586007)(6666004)(356005)(4326008)(70206006)(40460700003)(7636003)(6916009)(36756003)(36860700001)(82740400003)(41300700001)(86362001)(26005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:07.3182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 826f1ec0-e499-447f-2b9f-08dabdc36d3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814

The patch series:
- Adds tegra Tegra234 HTE(timestamp) provider supports.
- Updates MAINTAINERS file for git tree, mail list fields.
- Updates devicetree and API documentations.
- Enables HTE subsystem, Tegra194 and Tegra234 HTE providers
by default in arm64 defconfig and dts files.

Dipen Patel (7):
  MAINTAINERS: Add HTE/timestamp subsystem details
  hte: Add Tegra234 provider
  gpio: tegra186: Add Tegra234 hte support
  dt-bindings: timestamp: Add Tegra234 support
  hte: Re-phrase tegra API document
  arm64: tegra: Enable GTE nodes
  arm64: defconfig: Enable HTE config

 .../timestamp/nvidia,tegra194-hte.yaml        |  44 ++++++-
 Documentation/driver-api/hte/tegra194-hte.rst |  33 +++--
 MAINTAINERS                                   |   3 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  20 +++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  20 +++
 arch/arm64/configs/defconfig                  |   3 +
 drivers/gpio/gpio-tegra186.c                  |   1 +
 drivers/hte/hte-tegra194-test.c               |   2 +-
 drivers/hte/hte-tegra194.c                    | 124 +++++++++++++++++-
 9 files changed, 224 insertions(+), 26 deletions(-)


base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.17.1

