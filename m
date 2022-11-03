Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59163B6
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLecmA5CzUn8iVOpXVBMeH1GEOove1F1/K/6XEtRFnj0thzXkeCUGlWcfX0kkzOaK+oIovQ1zdHHCPX5qHekY0RYbkT+DHU/nqcNvfRBTK/EOkavCJaRXLF0szvNg9bU5zCge8eTBw+j3HZ3ExY0YJZUp3cPUweGIqAl5+SklAOUOyyqzEnc5GW1bgGnQSIGRUUfHR03gTov6Y8kL5dbfBeGYC2o14/Dl0/WbPoy/isivUQkkNWrDjy2ScVsBFgV5q77BctW6x/4tyICDB42seH0+WhiuDF8G0pKdM6Kg7M7XxWNTWApM5GW4sDJJRaIhhai5y0IFNH+UJvvJCdusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fpcvZxqj7N5uABhbu8wuDFwEu46fGsJYV59DtpkJCg=;
 b=gPImj6W82vRL/dVc+1gVn/PqTujLq7fAdx1FVUaG5poy6I5SDPFrF8nYZNp/XwEgErdaZrjQCOI2dIEbn5MckQZoz6g7IgCQXaPFpYV0rebD8HsoXbTTjuR0vJ0psCJYNsKQ2UAgV4teXUfxXKchLcyAXWJO20IsjyDIc9GExzQjHr/v4irdMKh3Gmch9ZtCQhcy4AsfbRkBXkPSB+MHMdEbUHLFkaNbcEA7Q2Fg8Hng0AT2jKgQZciUijguH8p+VbowHgvUMzSAZn1RKxKAJOh6XRwSi4CspZSn1pX79h22i329NkYYj9Jy7WhQ6mn56fsKIb+SpFHwfLk/IyH9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fpcvZxqj7N5uABhbu8wuDFwEu46fGsJYV59DtpkJCg=;
 b=YuLnKW4ugX2tSNd9NnOAq+Z03e8GktlcVV0LeMLyFLMbu7PTg7Fn2AD95ky17VdfZyZ1N7O1YTLhRbjXamyNywuenskIKw9Hq6zJeXmbdcj6RrHBCy24Ygkgsh7y6DeLBiZb/7A1nktteWRUCQbNUZTJhJzezPVsF6W6WV5PeTNSeeOFedvv4XDd8o8MF7nbmFmdX54n4856pTVGSMU4hNUMA566OPmnuDKQekDSreEZwXqOYJ3HDXmRMNAp34nE4zKWdVquccA3Tp9xdAaV8d6UQpGHz6IjYuTQo1tW4j7Pam6gBnK49j8QDYxTmKBe8FN83YOT67uxEqVy0e3QKg==
Received: from MW4PR03CA0273.namprd03.prod.outlook.com (2603:10b6:303:b5::8)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 17:47:08 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::4c) by MW4PR03CA0273.outlook.office365.com
 (2603:10b6:303:b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH 3/7] gpio: tegra186: Add Tegra234 hte support
Date: Thu, 3 Nov 2022 10:46:49 -0700
Message-ID: <20221103174653.29765-4-dipenp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 3015bd8a-41ab-4bf2-269f-08dabdc36d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/hqGwXopv3+B+uqa6OJxwZx4zCiSeJimY9yVD/1AbvMHYpEGmsUTSyhUo26VOzZwVEngJI0I8m/RC0eXgaFAPxliXCkYiAYwanBiI9DutQVuQvYULoHXU6iPtUsE9ZbBvwUHPC3L30L+uvx65pPaDdwr16G8pripDpcufehFC9mAFjGw1XiW8rskY4/oIzf/GCbfm2+7iixNOCxRs3sUxN45//fLwXk3AUrABiB5wLj2/ucMLt2ktyLfnuTssIjyT/yaIGnwm0/6i0BRelowAzQtdicYG7WU7IKSoFDNX2qxd18fh+X1H4QU/ubqmqlW2mZ9mERLMrBOBF2tYrUbeZavKxw98v4YRxoA4Xdt4VzmBd2vOkxy7qWCJI0dgsNvBM5lkPqpTfgM8hdIBWluNlUY7N2g5gal6L1EKxcfYH/SE0O6xnsfpvu3fZ+bZ7F/D4p8gP1AdVbZ5VBZ/7rpn4A4RNHZtOARISxHSxzirZ3CfL284432BqvJ4lYWbCHXqTzJFa8lu0OtOBORfc3hl678HUgBK0iIE1FVPuh+FYniJOMwODZ3O2rIBuCJ4Hcr4j7xO5bbSlc2wJ/OPZtOwqIPdfD2Nq/cURbSYaF5yzKT8E1J3Y1bOHf6jdHHC/Ep6x4EiVOSohapcJd8T233GupMvlFof/X9bKdcKsykUlJDp4yuEOBXHNE3cBNe3QqWKbaHdIVjFhS294BKCAxV5hjjJ9j8d00RxK1/wTqFUgH+p0JxPLkNEAm9nPiKzm1CSZKFQVCR13Kta6KTDkZqpA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(40460700003)(5660300002)(8936002)(83380400001)(426003)(186003)(336012)(356005)(86362001)(2906002)(82740400003)(7636003)(6666004)(82310400005)(70206006)(4326008)(41300700001)(4744005)(70586007)(7696005)(107886003)(40480700001)(2616005)(6916009)(478600001)(316002)(8676002)(26005)(36860700001)(1076003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:07.6739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3015bd8a-41ab-4bf2-269f-08dabdc36d63
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755

To enable timestamp support for the Tegra234, has_gte variable needs
to be set true.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 54d9fa7da9c1..c2ccfee52608 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1136,6 +1136,7 @@ static const struct tegra_gpio_soc tegra234_aon_soc = {
 	.name = "tegra234-gpio-aon",
 	.instance = 1,
 	.num_irqs_per_bank = 8,
+	.has_gte = true,
 };
 
 #define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
-- 
2.17.1

