Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB563B8
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBwDBzN+dJCm11CigompcVW95mwjQuVC0gvJyMRPxYizDU+V6rVgHzXNUUC9QQcOduHAX6m9OZRAeOF1TWk6KoUVtRTFPIqTfhnIpsXHAGIIALQ3x4Jq4AZ/BFelib3hjEsjRroqME+IXkTcVNgNTvIZQW3ecYSzDIswz03La5Px6Uo9o0ew6lwXs7XzO6ppbtvXX3GyWRi9Awj8M9o2SMcNfoSZS6OxwOQmgxzCPbJpWN27kKwsyfS90IGt7Q5P/zEaNAreQy/Lb9dGTP2dpA4xY1YmbimXO0+0cnubQXvaGU24RntvolkW7Z9nrg+dI1LN6vcn0DJcryznBA7Law==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjbHZfAEXm7Tpt9u32Vn9q9T4Up+3nN7WFwlqHYtLGs=;
 b=kHzJtlJf387I8zmwBsgSTNLbkjpR11k4YaMp3SE9r2JRZyQfWAo7nNFFRhg1ZFJAUb/4Vam/F1+LkTYgIQFC+nGYltBzZlm2AeFQsZQYxmy56s1okgKAGoUGwx/XAEVjPNORDGaFccID07R80sdxwVWH0fp6iYD09JUo/fPrG9PLGCm3K7Ho59cob+az7rP20+CqyTDgSgVNYhp6/kSfeoVt8jLPuEaqTVRJ1CpiMn5spRQszaYKmR2NpFT9EF9S96/Qot2NRnuZ7QeUPQ8HS844ADbhKCix5ecAXqDzF8/lfhQE8bFZXbOtmuJjZrNuvh+f5DZWbW/QUjMqpC60tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjbHZfAEXm7Tpt9u32Vn9q9T4Up+3nN7WFwlqHYtLGs=;
 b=gVUW4aHurn3a/paX0jrj9k4+Ef16BjBd5EAH7yagV5+rNEK5hnk5RJpQF6tioUiAVaD1sTjDa7UElDlXtayfiWh6/TeEuBFBqW0oHBLfgGqcRAWQXIvWcf6pF2tV0L9lx29/3jrhqu5mv41HgqyPL8A33/6DQQ58kKPCA0d2yuEU5fga60qcCp1U3G99DX8Hd70rcVzELvpjZVldOauYKOZy6OdRJuIe1J/4HLHHRKlsU1JfHNflh1ByZMJrufSrDJsV+e4h8zgFKun8Lk/RisYQC/r5NuXzy2gd+QJLDJvzeJqBIv7xzbngAW34F5kYC/f4/4nmNUi2vkFBPQqobA==
Received: from BN9PR03CA0405.namprd03.prod.outlook.com (2603:10b6:408:111::20)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 17:47:09 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::ba) by BN9PR03CA0405.outlook.office365.com
 (2603:10b6:408:111::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:09 +0000
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
Subject: [PATCH 5/7] hte: Re-phrase tegra API document
Date: Thu, 3 Nov 2022 10:46:51 -0700
Message-ID: <20221103174653.29765-6-dipenp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|MN2PR12MB4112:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b59bfb-c43e-4801-0e6f-08dabdc36e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DMm+UX0DbjVbJFechw1urA3k2K8xG5MhiALHziLHV9L/QsF8/PFZUFtzehoEv/SWrt4hzsQ540Lifzj8KJS6dKFFk8lczOq4HklVQQhLqbiQdbIAo7K/We8+zqtt9HF9i54DiLUhXA2QsaCwg/KByQvXKcuk4PRL6nJD0iSsAcEy6/ksVoMM9dKU9PBKDMjlqGH1UTbezo22PZ1TvNPlejaQ5cXUhv7zYCn+K+U3z3/hnslq7mbWyhjNs/0zzCYKh2/xZ/b2hOuMpVvF2fFKQ5+a0n1QuJzziYBcMUJvg5olMjGLLRfqIAYpwA9NwV4BLrdz7SwcHkK0PaYrOzCFoGaSYvP7VohkPDeNzlFMCRmkpqDuHwvK7JVMEMe700zV1Eoe09Z2vS7zOZc1O0KBsOOfiirhqwg6zH1WybFZGlLMYpaPouEFOyjQywkzJFJFbnK5N3Ve6hMar+rdaVz+N21sU28crclYc0GHE8NzXDNxMcI9TZ1SFNI+ak1S4v0J//oLwmZM9gpwR5N+6Brj50XICHOjHbEPQNulviHSdJUZp/aS9FfRGLDMvwX8fiuR/5YDOWYzBKJwQkdDZsf5nZoFyA2vWOUPEPK6pu6nLE+GMwwPkBuMStK1dNpo77mMc/OwKXDd0m2erQsZcrR5FE5QO8RHRdxqnCA44icEhh5IP3E0CmtYIDI9BrpErclHTZ+5Uxn29jkGRz0amPyVkwxlD70QiG9B9yxVtQScpO8Ol53wQj8VuwSK4KkfH0bC
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(6916009)(316002)(8936002)(5660300002)(4326008)(36756003)(40460700003)(70586007)(86362001)(70206006)(41300700001)(26005)(8676002)(7696005)(82740400003)(426003)(36860700001)(83380400001)(47076005)(2616005)(356005)(40480700001)(1076003)(336012)(186003)(7636003)(6666004)(107886003)(82310400005)(478600001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:09.5456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b59bfb-c43e-4801-0e6f-08dabdc36e8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112

Make Tegra194 API document generic to make it applicable for
current and future tegra hte providers.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 Documentation/driver-api/hte/tegra194-hte.rst | 33 +++++++++----------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/Documentation/driver-api/hte/tegra194-hte.rst b/Documentation/driver-api/hte/tegra194-hte.rst
index f2d617265546..85e654772782 100644
--- a/Documentation/driver-api/hte/tegra194-hte.rst
+++ b/Documentation/driver-api/hte/tegra194-hte.rst
@@ -5,25 +5,25 @@ HTE Kernel provider driver
 
 Description
 -----------
-The Nvidia tegra194 HTE provider driver implements two GTE
-(Generic Timestamping Engine) instances: 1) GPIO GTE and 2) LIC
-(Legacy Interrupt Controller) IRQ GTE. Both GTE instances get the
-timestamp from the system counter TSC which has 31.25MHz clock rate, and the
-driver converts clock tick rate to nanoseconds before storing it as timestamp
-value.
+The Nvidia tegra HTE provider also known as GTE (Generic Timestamping Engine)
+driver implements two GTE instances: 1) GPIO GTE and 2) LIC
+(Legacy Interrupt Controller) IRQ GTE. Both GTE instances get the timestamp
+from the system counter TSC which has 31.25MHz clock rate, and the driver
+converts clock tick rate to nanoseconds before storing it as timestamp value.
 
 GPIO GTE
 --------
 
 This GTE instance timestamps GPIO in real time. For that to happen GPIO
-needs to be configured as input. The always on (AON) GPIO controller instance
-supports timestamping GPIOs in real time and it has 39 GPIO lines. The GPIO GTE
-and AON GPIO controller are tightly coupled as it requires very specific bits
-to be set in GPIO config register before GPIO GTE can be used, for that GPIOLIB
-adds two optional APIs as below. The GPIO GTE code supports both kernel
-and userspace consumers. The kernel space consumers can directly talk to HTE
-subsystem while userspace consumers timestamp requests go through GPIOLIB CDEV
-framework to HTE subsystem.
+needs to be configured as input. Only the always on (AON) GPIO controller
+instance supports timestamping GPIOs in real time as it is tightly coupled with
+the GPIO GTE. To support this, GPIOLIB adds two optional APIs as mentioned
+below. The GPIO GTE code supports both kernel and userspace consumers. The
+kernel space consumers can directly talk to HTE subsystem while userspace
+consumers timestamp requests go through GPIOLIB CDEV framework to HTE
+subsystem. The hte devicetree binding described at
+``Documentation/devicetree/bindings/timestamp`` provides an example of how a
+consumer can request an GPIO line.
 
 See gpiod_enable_hw_timestamp_ns() and gpiod_disable_hw_timestamp_ns().
 
@@ -34,9 +34,8 @@ returns the timestamp in nanoseconds.
 LIC (Legacy Interrupt Controller) IRQ GTE
 -----------------------------------------
 
-This GTE instance timestamps LIC IRQ lines in real time. There are 352 IRQ
-lines which this instance can add timestamps to in real time. The hte
-devicetree binding described at ``Documentation/devicetree/bindings/timestamp``
+This GTE instance timestamps LIC IRQ lines in real time. The hte devicetree
+binding described at ``Documentation/devicetree/bindings/timestamp``
 provides an example of how a consumer can request an IRQ line. Since it is a
 one-to-one mapping with IRQ GTE provider, consumers can simply specify the IRQ
 number that they are interested in. There is no userspace consumer support for
-- 
2.17.1

