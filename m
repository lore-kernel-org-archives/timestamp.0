Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8C4C74
	for <timestamp@lists.linux.dev>; Thu, 25 Aug 2022 21:50:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSpP+zE0LKnQGipdg4uUsOzq/vI3oAyePUHj4QrX1Gi/ykYyU7lALgjxMy+yEbn8TWDCHQHqAjCmNmXN/atrmSFoS7h/qrNU5spxkGfX9KBa7Gb6CwnMjvKUZOsJQPKxYCdvYp0A3Hh9pmuMs4eZ80g2OKS1yTx/B0ou5mTpGz9sEQI1yjVL9ESWA+Kxyh8eFq4sOwBIzIaopWUroEyJNhWpns5/CrbwgsN2q2lkA6zfikuWveNHm1ybNogKwrka8gDsbxQ9EmEIWV7Kobfyp3hMWcdDXoP3CQSr1DKCSx2kwJdkQCEgxtKCnicTUjKk7uVtm9zGdy1FL7kW9k7H4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTwT5s0tZeQbNWvkPN6C/RZcxbMnvshdeOWLI9ZJ0Hg=;
 b=AJqguUh3CXuJYtZff4BsS8clODMd3ZMy+yPqDxnCr16tLUwcmRg9qu2Zgc5DWJZJ3IUo+lqBIaiPXvhZv0YD0RiMT7nHt4i17SNB9zT8T5+HLaK+qdBeH3Y93CbXtaFf5z5WhDWEup/vUjzephjxIu7q9OuKnJk1dgvtPlhX1B0Fe7feC3Db1X5uWR/xmLn5RnIrhEeD0ahUWJWrQ06+IzDP955hcM7z+ORVCzo5pKkU93p3FKJ0XudRnqfhecC1PmP7UGIq9Shvu86BDrN19mBDMnhfUXKIkY1g6y5XCKTQfwys+BPVE76sv9lgyzQOIvfiRo6HIGKPGupSgZsRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTwT5s0tZeQbNWvkPN6C/RZcxbMnvshdeOWLI9ZJ0Hg=;
 b=rO57y3OODSwadPZ55pSgd0KAnTtqQ2GVjY2yWj3qKdOBBkPwb8jql+H9EN1fm1uloPCpJCDhje3LRSZYrcVjExLAx9GGrfbz/23w34wdzYAknbdctgvIaaI9vDhY6Oi4Zu6W6eW7Z35kKtwCuwULBmhqpnKf4E/ZV37kYBrJWQzMYv9o7YRC5QET5pU1dpfyjZHieMUWrUEoKxt3pfeWc1fSQ6ahgXIOBr8fyKV1UsJwHdHNVLuaXzsFgEQ26lAGxX3lIlWV5oTFN83+56PikhdYzF98pCoAM+Lm3CFMTsNl66PVWOaYzFHY81iPCvep3ec2w/AKRDAUCjTvGeo7QA==
Received: from DM6PR11CA0066.namprd11.prod.outlook.com (2603:10b6:5:14c::43)
 by MW2PR12MB2427.namprd12.prod.outlook.com (2603:10b6:907:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 21:50:10 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::53) by DM6PR11CA0066.outlook.office365.com
 (2603:10b6:5:14c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Thu, 25 Aug 2022 21:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 21:50:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Thu, 25 Aug
 2022 21:50:09 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 25 Aug
 2022 14:50:08 -0700
Received: from dipenp.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 25 Aug 2022 14:50:08 -0700
From: Dipen Patel <dipenp@nvidia.com>
To: <timestamp@lists.linux.dev>
CC: Dipen Patel <dipenp@nvidia.com>
Subject: [PATCH 1/1] MAINTAINERS: Add HTE/timestamp subsystem details
Date: Thu, 25 Aug 2022 14:49:56 -0700
Message-ID: <20220825214956.19120-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ddaf893-e6f4-44a3-41f9-08da86e3c81b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2427:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ik74ESPugUzpejkwykezBOZ0o7RujTH7ik2Lh1Zg+XWR4DqjIFlOUbwN+pT1jZseQGHq/055cXkswgeqwh7bC0T3BE27M74OuIJwdK1YCxanSdaJ9KZ7mDAzzkC8KTa/dXgefmetBBvEsnhAGmqT1XSzs5QcgugEslzQ4m3efrpW3jRfk3dR/k5L9eYbJ2xLBRrKjWG0iEmH41e4pSP0XTqT4b9OdKfKp4OSukNSS41zwmRQbjseBUkaccdahcsunHwKTR9D0x5EZr5HQwItr3srrBafaMmdBhkOO8lkyko47C2yDrS2SoTy2JIKm8ed6DhZhZOXlwKgFu8OKPGWvzy8CLGMLkYdVF3bK+8gcwFSIMhE7GakXSrO979utJnRRRsIF39+DHscW7zCAC2mEWEu2Qh1YmyhbRNDIraaKvMSHuDXYLCloErak6QKPYixk/BaMQp8QcV54L2+ukG7vrv8CvGcDVry7rwJlD8eypVnwBdMb5Ro274bGOqF6OsfKCcIznneUs7wDH5Fx/iVmGALgHbaOA7JGtv1Cp1EQsxIr9WEYAtJ2WzBvpW+GD0sDCE8IffvgUaATqxtkbsJtkRnhmwkCpDiGmkYEeC3/rFY68Ll3BL0X82duRjHNJ9//VQlZslzM48WWlJZkyvoIJ6jYeVIHWAk2KwIyWry8/Sqa38x0YpEkcbyn8voluxsFcY1PRdgmh/Fh5d/lN4qXak8C/Drh9NMcXbe7/lcsiCcsKLRK+tVVfRoLIJSIluioHX1ZxfMQhflNGX+47qrgLx4KxYhe9Sat0HnOpLQD0aD7tbihOAiNg3s2BOf5GLUtNJ/svDGdR4ZAWG1l+JtVX0BTZ3Qsqo17xwohWIYRct9P9UnVmJivI5i0MjjSUZV
X-Forefront-Antispam-Report:
	CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(40470700004)(36840700001)(70206006)(36756003)(41300700001)(7696005)(4744005)(6666004)(82310400005)(40480700001)(2906002)(26005)(966005)(86362001)(478600001)(6916009)(316002)(107886003)(336012)(1076003)(186003)(82740400003)(81166007)(2616005)(36860700001)(356005)(70586007)(5660300002)(8676002)(8936002)(4326008)(426003)(47076005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 21:50:09.8180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddaf893-e6f4-44a3-41f9-08da86e3c81b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2427

Add tree, mailing list and patchwork details.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fd6a1721e69..b97cfb7d6fd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9326,6 +9326,9 @@ F:	drivers/input/touchscreen/htcpen.c
 
 HTE SUBSYSTEM
 M:	Dipen Patel <dipenp@nvidia.com>
+L:	timestamp@lists.linux.dev
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git
+Q:	https://patchwork.kernel.org/project/timestamp/list/
 S:	Maintained
 F:	Documentation/devicetree/bindings/timestamp/
 F:	Documentation/driver-api/hte/

base-commit: b5d939c951865f6fc229094e84b77c9a9e0ed0c7
-- 
2.17.1

