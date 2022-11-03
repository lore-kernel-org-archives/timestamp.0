Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC663A0
	for <timestamp@lists.linux.dev>; Thu,  3 Nov 2022 17:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmght4PO27i+tJ6JwCSlLHGYK66RfurIgn9TUZATTCcm3otJ07tQcGEnJIfKqrALWtpw/GUcF+Ytvpj60PkCYdgXBrLCdfeEXmi/dtqy1HMJzRPJeXIDvf4s6mezJT1ODfXQLCPCrIprD5kA8sXOTDsvm8j219mJl22Z37sauhc/66noDxEG86KIvS6LtTSPVO4iW38ceSxG6nw95906ElPMdWYWZ9w4oQzE2x+qVyCGVkoJrZl5MX1QQVwtiOCsbO88pVrxfM3aSRTSXeVdmw/OvBu7W2jREcJfIo2GWGgGyOjkWfXDkcYyEDOvv9PLb9e35V2EINjUn133b1PLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sQo6xxtHOxTMb3Y176x5BNhPW3VFYSlHVEqRwaiEBM=;
 b=QUdA000WuofxTO+A9Q6f9GNhhWEgL+i5E1f2PGh3SC9p0aLmb2HInoSy/PPfNxSSxq00q8kt1VFV/krd4XQmuoG65VBw6cPPhLkmWufqV8YkUOex1uW+qMTvADX4eY25zlI8eNBteveTe5kUzIB0YB+WvD7Q02Iwk+7oMQ8p6KCQiHvxnJV0PxEQnsd0l9ptkzUZBmWnt+NSEST4hd37WzJhG58bwaVj4XElLBWPTCqGgXwVvrbjQt0f4Df9NiZYUussHlB/J7/l9GG6al0Jm5uiqjRsrsX7NnOtGkltJ3pOnUjTLD5jXlnUzrDjR6idMLZyvbjqfFABWTzw1IOiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sQo6xxtHOxTMb3Y176x5BNhPW3VFYSlHVEqRwaiEBM=;
 b=dP16d/JfVlWBuaERzTR8haijqbE4wLtFjPbPv9P4SlJAi4+WNO4Y8oyMQwE2fxO3k1lEdTX9ytkkaUCE9EWc3IKG6CeHkqAV0852+ClhG6Hbfhy24cFpWewIFAJeEzCqY73vIxI7RTsJLvrFcTyYnm95OK5Ez+Bjn/j8E1TtbMUg+POtJpMLYnJqhDEPVEvNDtm/CNcLZmeyf5GFgXQb3SCSSfrQZH3cW44RVu1ozghyJPRjarIFRw5qwa8F521irG4+vg8/iWPQatIF3o1SnnjWSolup++r1rU7F9Sy3ZH66UOWJz8KBTa067AWeEPfs6HQTiCQ0u/+jbYJIOaATw==
Received: from MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::7) by
 SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 3 Nov
 2022 17:47:10 +0000
Received: from CO1NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::8e) by MW4P221CA0002.outlook.office365.com
 (2603:10b6:303:8b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 17:47:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT111.mail.protection.outlook.com (10.13.174.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:47:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 10:46:58 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 10:46:58 -0700
Received: from dipenp.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 3 Nov 2022 10:46:58 -0700
From: Dipen Patel <dipenp@nvidia.com>
To: <timestamp@lists.linux.dev>
CC: Dipen Patel <dipenp@nvidia.com>
Subject: [PATCH 7/7] arm64: defconfig: Enable HTE config
Date: Thu, 3 Nov 2022 10:46:53 -0700
Message-ID: <20221103174653.29765-8-dipenp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT111:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 93186a00-1cd0-48c9-0acf-08dabdc36ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XulvAsVjkxu0zfQ1zJ2frC2fnrO4pA+hPdCmciYwWxwZv+dIBsK0vQb2zaVfTm23HFqMQw2V8Ux28DRORQpizuQb1kPfquuxfhVck7QSlydawJWTTouh6JitiQVNAzP/YnxHYUGqhQyveTxrZgMwvFnEOuhOQUlW164hxTlKqUDT7GMYWwfs7yPvjqpesmZPAYjtsIPH3JRdvCILfwM0pSw5i70B0Dv/vU9nlpl7mJXXqnnzJvUNBSWBTAUh9G2mcZrO+DSP0TDvWl43SwbA30wsAUf3+neXNPmKlX0g2Aj7Xw/27VI5dxAXrxeEA0c2ZvcvJ52eQxfVZzhcKfDO9Y2/iXJk86kZarC7fP+R99jGIZUU8T4oGUDU7FaOL841Mv3+4l/rOUBjoN/5vThbCPdQXRd5avTXCkMNcCUIgpP2Nm13Tdo24DfdHdSiemKgS1ymhXo7dvijGKj5NBT6Z3uPPEM8ygzGpLrnRtJRV9hrnUZv05RGw1plyP06i/hbR0TzssPAhIZxeFBnHXjM6kfnn3zCfsi4dHF7U/Kc3992+yQiosw80dFm0VAlRJPXHSdtnUx32DTZmevxBr1BOCX9y0VSg88ylv4LqwVGzLosObxxdc9Ptx0aorgnGTEJ69FaOMkMA4JTitxqaJqNLcD2cseq07DvLHmondtoSmit4PE03lEFE3pz738G1ioAoAN3D9oh8aeC7NDW1BifXe2OasVGiDk52zl/5iR9UCNWHYEZQhGKqnnOa3kMkuVjTiGgwyYed27TUYrMTWHHSQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(4326008)(8676002)(7696005)(478600001)(70206006)(70586007)(47076005)(426003)(82740400003)(2616005)(6916009)(26005)(356005)(7636003)(82310400005)(5660300002)(40480700001)(36860700001)(6666004)(2906002)(336012)(36756003)(186003)(86362001)(41300700001)(40460700003)(4744005)(107886003)(1076003)(316002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:47:09.8253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93186a00-1cd0-48c9-0acf-08dabdc36ea9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148

Enable HTE core and tegra HTE provider by default as built in
module.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0b6af3348e79..c6e04a4f89d5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1307,6 +1307,9 @@ CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=m
 CONFIG_INTERCONNECT_QCOM_SM8350=m
 CONFIG_INTERCONNECT_QCOM_SM8450=m
+CONFIG_HTE=y
+CONFIG_HTE_TEGRA194=y
+CONFIG_HTE_TEGRA194_TEST=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.17.1

