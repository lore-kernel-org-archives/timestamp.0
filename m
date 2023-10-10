Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96AF24C7A
	for <timestamp@lists.linux.dev>; Tue, 10 Oct 2023 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1zVf4tq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696947106; x=1728483106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2VBQXVArfIBgHPpUcs1zlQhsNpmKngH8nu0wk1tf7IE=;
  b=E1zVf4tqyawx63DGJ/6zR3z2nyHb8/WtxjTki3wB7IFd1UIvyzLu625H
   bB2+Zz5/a3BtBht2QfTsVSX74/v4BPxrnNH86enU7tfy9b1SF9E41m/3Y
   ciiU/RxIqbPLZwhkx7HKuhVFsp5sbEZG5Le5O75wMZyb1EzTBftkAedCS
   q4boTpv5nhH21GQnwCjLTf9WV/H8maMnFzg3vl2YuCxu5ENuTsxfPTacg
   9tpyYZRa3ToqshT2T+B6FGjUhJUJopiaD/KlIWNin5oCbCcNPIfdbGmlf
   GaQnO0W7h50JI4KDjIFzqX3wzfIiDo4fDJxoElS2lTssod0umu2IutJJa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387241765"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387241765"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1084802382"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="1084802382"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2023 07:11:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 49F5B35A; Tue, 10 Oct 2023 17:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dipen Patel <dipenp@nvidia.com>,
	timestamp@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] hte: Use kasprintf() instead of fixed buffer formatting
Date: Tue, 10 Oct 2023 17:11:23 +0300
Message-Id: <20231010141123.3909596-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve readability and maintainability by replacing a hardcoded string
allocation and formatting by the use of the kasprintf() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hte/hte.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
index 1fd8d2d4528b..23a6eeb8c506 100644
--- a/drivers/hte/hte.c
+++ b/drivers/hte/hte.c
@@ -17,8 +17,6 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 
-#define HTE_TS_NAME_LEN		10
-
 /* Global list of the HTE devices */
 static DEFINE_SPINLOCK(hte_lock);
 static LIST_HEAD(hte_devices);
@@ -389,13 +387,10 @@ static int __hte_req_ts(struct hte_ts_desc *desc, hte_ts_cb_t cb,
 
 	atomic_inc(&gdev->ts_req);
 
-	ei->line_name = NULL;
-	if (!desc->attr.name) {
-		ei->line_name = kzalloc(HTE_TS_NAME_LEN, GFP_KERNEL);
-		if (ei->line_name)
-			scnprintf(ei->line_name, HTE_TS_NAME_LEN, "ts_%u",
-				  desc->attr.line_id);
-	}
+	if (desc->attr.name)
+		ei->line_name = NULL;
+	else
+		ei->line_name = kasprintf(GFP_KERNEL, "ts_%u", desc->attr.line_id);
 
 	hte_ts_dbgfs_init(desc->attr.name == NULL ?
 			  ei->line_name : desc->attr.name, ei);
-- 
2.40.0.1.gaa8946217a0b

