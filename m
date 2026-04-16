Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35918288C0E
	for <timestamp@lists.linux.dev>; Thu, 16 Apr 2026 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776362850; cv=fail; b=WUxp8wrnSIu7zHp03aHXCtVuybNburn+LbBSOnyhLInfwjdhuHk6Wid0D28MVgUzfY8mHNQhJ5NFSiUWHsIzUkfZ/BNhbmX+ePdnZYCFB+FPrjH42Z3ImS7pv81p0EPmnItStOjjVgYQ25h/+iL1kboBpOYF2CcY6qANYjXoIcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776362850; c=relaxed/simple;
	bh=RAYuaCXGcD9qIm5FcwHoWh0UZmlb/l09mbUr5rvQKT4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=doQHzi3RYJj7ZsV1UTAE4e1O+5TQX1R6A0w9KnctqDUYve8SHRNmm4EiixaPX/9X37FDTnXazux2T4u0vREsFedNpqycyTKekGH7PH7WeF1Qqbq4OFkJjsH/tLSe0n872xbv0Igy/QnmU8f7etmyrnhwF7CuSt87Yt9jbqLjPNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H5i2C/QU; arc=fail smtp.client-ip=40.107.209.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H5i2C/QU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zc6+tYWVTcTaV7sFgok3S5doQSQIzXnJMkQKxYZ5jklk44GeEBQHsjuf1CO+HS9HbzL6xwyz8T2iT2GGQJhnW2ExGTq3uWqJ0ODYk08Noa29J3g06H2Rf70qUMygu3wXwRTiZHB/MbXBOhN3l3RVQECRENB7s5ZLK3YqqwC2zJNjP6i7hC+xcBZ3o5rTRU55+ZU8iuubAcdRHfzx3VJnvBTqOswwTEgzWXPz15We7K5XUS+fRC62o9+vN+FtuQ6lgjgW8OEyDoBsJ+1aVL4vuWiYkpAOwk2en5vePAEyR6weEuJjmDpaiZo0GW1GRrnc8qCGuEEcjSQyL8y071a6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zmtycRfm27a3Qg4neCV95WiQyM55UVln7LO7m2G5mE=;
 b=Ow4hfx3wjSVcEnh7mXhEKsImFdoMWq5isizEUUsTuwf90gXYOLFN15fDvdc/J2Z+dzFHTyJ84kDOgrEze1foL9Std8o+4p4vyAfF2YcCIceSoijpCb7OOYSaEjA3lpJYNh0KgSec6VnzeuzlwkZnBLUnAW8rOnxjnDcInwcpjo94BgnuRTiLkpzR3p0cfx8Z0wJWNYCxGo8feaSrNchi5d9eWFjQ0QFyBvfm4WdUoWLijRL6HxynI6r42KGzXCttwQQglFZPXItly8ZT0gJHxr1O0HG6XR52K8JV8AGOSGyB738Amp4CQjcGF78luZFZBAp/4yQa9wXIIk2F01RCPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zmtycRfm27a3Qg4neCV95WiQyM55UVln7LO7m2G5mE=;
 b=H5i2C/QU4O9pKAV6nmgove9BzcNixyMXH6YmH7PVcmxaJMIqIIBikpSB3vsSaicYDOQtd1o8cc0X4VMhX5F/ghiVf8Qi1CblLhvGHd+1DJ8azMnJBNxkW3Rwg0jPmJqbPR4TsTry3EiiYyVA3u4eAtj6iD9fqo3hhsEQ8VlnY0SlO0niDr60LrsPwkS1BwTLuBS6E3O1nbxTQvV1l8XIb5a1EgyUtSaLunWJHbMwdnbvQa4L90+ufZxsy7fG0hoEh1J/MG7RLP0FpwOr7dJZ8A+j0gKdk1HaPa89JBQ31xwHQfmkKJbEYwFxjEYJjN83AS8cGHFYV0k+cTOiADneKg==
Received: from SJ0PR05CA0204.namprd05.prod.outlook.com (2603:10b6:a03:330::29)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 18:07:21 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::28) by SJ0PR05CA0204.outlook.office365.com
 (2603:10b6:a03:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 18:07:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 18:07:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 11:06:56 -0700
Received: from 717d7c0-lcedt.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 16 Apr 2026 11:06:55 -0700
From: Dipen Patel <dipenp@nvidia.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <dipenp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<timestamp@lists.linux.dev>, <suneelg@nvidia.com>, <flavra@baylibre.com>,
	<marco.crivellari@suse.com>, <tj@kernel.org>
Subject: [GIT PULL] hte: Changes for v7.1-rc1
Date: Thu, 16 Apr 2026 11:06:48 -0700
Message-ID: <20260416180648.1498953-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 6112da4a-1959-44fe-4cec-08de9be300f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+ncB/dG+xIp7bEhk14xqAXpmlc46TaZyOS2SsVhrOX6u/mq3vvFUiOYd8sbKwsW4enNHydzvTiZZPCfvvE8baIxR+1vKU3v/E8mKOeAUlKCa/hZ3Rd5yQfVri3Qi5vzUxYRbHfrv6F/fqHgtWRAF8CCZmggZEjz+hf6dRQQaLiuY+HdA61AwTur1zIM0EIVQb12CbLyXlETj47gghhxZDHo+Nj+2YgOyX+dVC5vpdPRiOshfolD3WGoAYvj8QBm+guZsaKagFV+OdPhICpY4T652dkilSqkzsIqHjPQAxRx1gEtyZ74ekLINKs/PD6WGFpyzbMH+sYCzYnCh9/PUKxGmYabZuA4bYaqSIUWLGd0veezfGvEYbUazoZL66js2QNHEq4toilD6MCAvQirtEewCn/JkkNpKwPcUnIASJkBUtzFy7zcu6g2Kp6pGYbKT9zrkLIfvFWP1ZgFLRNxFlYKlGXzGLA+Gcdgx0UrH4TDr8HUOJOGL42HLGSfaZEPoiQmO8/EYPbfbxBsfrmPQJOQH64zx/f1QcoF2L5Yk92AUSveK96Q7H6KnxNgxFU1IAsAr5AYztiC2tzaeBrezuaY926nz96EXvDoyt1NxSb9zqfEJ35sj+3FAB4JgMzW09twh3JBNhsI5xXHFp2dP4kl5iw93+/VEUuor+K27u1fukZx8XpLwIchUiCiGGSZT31Mb19HjdzUUIXm2O335g9DnP2miOMZqzLd0YybG9wAzlsJQdvcT8mZ2BLUpX3qFctrTKW+SRV/RLDLDEV8b+g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	525iT/o8q+p2INwqcfFx7woj8g6kzs7tZyWgJTj/PTAxfGmHBQuHjtDvpesPw6KLL+U/Pr1qdKD9lQWHjyQu2Gt529chdwPrcFjd9oyyu3SEs7swEjuueL8N/gmZpL2KF0rvWV06wtd1WQzxMUggqYRUs/kpgi5fKqLkD77idUFVTw9iqQkDe7oXuRylxDWLOKZXPaT89li6LA6q4Eegi97AH7bJXHgstFgD+3tF0UhuuJUtIPRv5/R2y8cjvZGuFOulkjkzxWkeyCf5L8rM7fSMWoG9/dutrSFlLiM6+XF3AtQIedpI54znMlwcQkDGt5eDkkMunpYbF73SdfQ05fDLr5hx5QaXmArDqy/QvrNSg3a2Mx2wdmES9SChyx+u+e9u41usYo4f2BH3oWHQ/k/mxpWF9Bskm556dQTQ0EWuqswCHUBmE0iurWIZbi+e
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 18:07:20.7441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6112da4a-1959-44fe-4cec-08de9be300f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-7.1-rc1

for you to fetch changes up to 005b25ad11717139ca5c14c9f06c2a60855c2afd:

  hte: tegra194: Add Tegra264 GTE support (2026-04-12 23:29:31 -0700)

----------------------------------------------------------------
hte: changes for v7.1-rc1

The changes for the hte/timestamp subsystem include the following:

- Add tegra264 HTE driver and dt binding support
- Remove tegra194 SoC Kconfig dependency
- Replace use of system_unbound_wq with system_dfl_wq

----------------------------------------------------------------
Francesco Lavra (1):
      hte: tegra194: remove Kconfig dependency on Tegra194 SoC

Marco Crivellari (1):
      hte: replace use of system_unbound_wq with system_dfl_wq

Suneel Garapati (2):
      dt-bindings: timestamp: Add Tegra264 support
      hte: tegra194: Add Tegra264 GTE support

 .../bindings/timestamp/nvidia,tegra194-hte.yaml    |  14 +++
 drivers/hte/Kconfig                                |   6 +-
 drivers/hte/hte-tegra194.c                         | 133 ++++++++++++++++++++-
 drivers/hte/hte.c                                  |   2 +-
 4 files changed, 146 insertions(+), 9 deletions(-)
