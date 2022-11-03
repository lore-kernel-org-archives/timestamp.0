Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476263A0
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrtnF6mUDAjI22Db+9ppQquE7K0a6umFLsp6REMCKvBJDqdk+wzvG72VXoFnyN32813DPj+OyZUJGahQP645nsX/PcjhKu9P1adMB7hlETzu3l1lPxdDAoJj1TLQDpxFYypNDQperbDaBer77LGwZOTUynrwDFhkF9FB1gLAkoib/NSz2M4vn1YFEb8Z0gNDV4NU+xJbShe0LPrEvx76dRMZ4DvNcA3zIUmqcKs+KAM0cJobIPMP5fM5pI2Mf64pfcZ84VVXgzv14vEhGCCgYiEr/EL6VKH9IeMcXUCz+lWIxZtiGkGOsrEYS0ubYU1nYEJvXCsqL4aTNtnjBSCs0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj7e8PC2PRaY0H8b3g2ib+VPooBvh+tykCi454oVrTE=;
 b=BwvPBGpecHz5jNposwToFWdfnc/v31J4RcGJL4ny2HG8uYcZ7P7NLcfnL2QIum5U3onMO0+VqQAd9gOtyhQeb1xngl1A8yA2fnv8Q+1ZAHK/abr+rDUhQfexHzOaVKGp+DmbjIfWZfaqvrYahZsv7EZVUnvp2fPyQPkVtc3hIogXn29Dfc6sVQrRHapL7FsMksT260xYnx8c7JkVDthX9kFRQtzDBv2qEh9C6612evhH2amE5y812h4GDtbxRBaCckQWH3AkSQa48/uqAD4vaLwL9n6swadWUmIdakWFDDyev4pGbp+Wkt1Wi6PxEIP2zw1aprkMndCyuq9TCEgmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj7e8PC2PRaY0H8b3g2ib+VPooBvh+tykCi454oVrTE=;
 b=qx7HIWoCvx1q3gUABPdnQ7h1yBP6EM0xUkxFotpto17pL/sL9d9O9ZwM0Fi3xnGb+8JeH3r5WWYnCl1M9l+YQi5K5wSD8f/tV0OBv7u5hsEULRts8ZrVzIO5ybtuhntDVzxs6mNvfYQeeOrh8IoSQOh6zkl1kq8QyIX8IbnAAgLw9Y58s3d6ZKfX8d3FTDcArC30rYLA2WfnELJezmgAIrUdiejRbHVXsVLbTzfCx28cfHfBunhe20TM4cKGVS70OJqs9qXmzpTLiZr7KMoehYT9pnn3/TRctjefp5H25VdGWSMvuuy8JbQBmR0kO8gZ5EPuVWuxCaJv+Sz4FVR9dw==
Received: from MW2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:907::19) by
 DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.21; Thu, 3 Nov 2022 17:47:07 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::f9) by MW2PR16CA0006.outlook.office365.com
 (2603:10b6:907::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH 1/7] MAINTAINERS: Add HTE/timestamp subsystem details
Date: Thu, 3 Nov 2022 10:46:47 -0700
Message-ID: <20221103174653.29765-2-dipenp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT037:EE_|DS7PR12MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: da5cef7b-149e-4b2f-bf1f-08dabdc36d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wB0GhhOV98KuRaA6gJjgKSNO1bsyEML2m4X1HxoKCkzDMeYSzR3v/K9ADtavxzRKBPBSWfdhG8jOwLL/cv6UAUCO3pTk0KNeWxGia4QxEeEmdoST1j9j6M8YbQe2lqzFFkMZgvt/yjzQaFdLgYARY6De7fzUuq/QcrezcI4OppKu5vv8iDnWDQUo9uKyCBGrSuyv4tKuAdm62GESAVR6ohjl9buxqCPJMrd3ppz+Bll6xKDZtQcLCGO+9KTmW9IfZ7GCKH9cZZ7fDuVdLfcHCnmPK8uBNXl4mO8jsNtoXZFSyKdO27O7YBBrE5vIZj8BtylrHJbYNxSErgDxjqZkFn6wUNhf7bDpBI9u+CqqLVizIVsVQ9EdJyyImXNhA6h8oe3u9CqAUNqqogvmVkD1rmYLfkH0HyFUcv+DEbWylqmbzxANxW7tKOI+iQFXDE/k+4rMKvKHOHiB/wSGRX11nlGNW4DHdw96FDuugKi5s5jowAI/m6Be6zDoc9vo319/yHn+UBZecYJfUjj8eS7s5rVQ4uTGEynxncPQXMogOBKMrTXYrjbUlj2DJGF9YA94NhPtaiYLdrw4WcPEDdzj7kgllwonr8+XiuBP4t4npj1tJpOqCgwY3UTYQs9HM5BuZw66yGZwEwcKPJK0HDkCDJsF2MO4sCUV+rEr8FlUAyvLxZOswmrq3cyItiMjpg8ZG97Re2QXY+f19gQq1n2d/nzlzTDdC1lJpXeMwzQk+IZKo5uTlrmSonhD9HJ1nsHC5LbZBrbOCSQDcwUL+XiFZGd1iO0P7UekjXapUdVojinCIqD2rxsVdKG1gNqQPEANR0/qAgI2MBdcLNNEamqN7C3owurrqlWBo2wnx6tIcL0=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(6916009)(70206006)(478600001)(966005)(41300700001)(1076003)(4326008)(47076005)(2616005)(426003)(7696005)(2906002)(4744005)(186003)(8936002)(5660300002)(70586007)(336012)(26005)(316002)(8676002)(82310400005)(40460700003)(7636003)(356005)(107886003)(36860700001)(82740400003)(36756003)(86362001)(6666004)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:07.1102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da5cef7b-149e-4b2f-bf1f-08dabdc36d0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167

Add tree, mailing list and patchwork details.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..37b17c1f1388 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9414,6 +9414,9 @@ F:	drivers/input/touchscreen/htcpen.c
 
 HTE SUBSYSTEM
 M:	Dipen Patel <dipenp@nvidia.com>
+L:	timestamp@lists.linux.dev
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git
+Q:	https://patchwork.kernel.org/project/timestamp/list/
 S:	Maintained
 F:	Documentation/devicetree/bindings/timestamp/
 F:	Documentation/driver-api/hte/
-- 
2.17.1

