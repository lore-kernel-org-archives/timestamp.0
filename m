Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0378355818
	for <timestamp@lists.linux.dev>; Wed, 24 Dec 2025 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766586774; cv=none; b=Fl+f9J1XqSGXCArXzIDt/oYejo8MJxO8Ee3w0f0lC8IcX/HMt+zSYVDokZqKyv4ELeG09sgKPJY78UEbBkW/8IqEOC/iizVy5cbSxowOtMNCe4+WIC6idt5Eg88I5FDzVpt1oQFlxZLPl94Q1y8KQelSkNLFKxdEiY3ACJHleQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766586774; c=relaxed/simple;
	bh=2pqRUlaXa9JD6jn1fryY0t4Gl1tMNTo1aH2Fc2k9FDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tk/e+eGRcnoQjRU9Cp5wDW1jZJjXQmBC5mlvWjn+NyJ7aN+51LBdEbumr0MlWV2teauxlwcOuZa+cqAjJI/x9sruHuPe3ruUCR/RlGNohPQvn07pg5aH+sXgWIqFCKo+NTXrLfOErdPRd3VvDHxB/gn/si8oDz7TWSpsDoZaPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z0DePJhd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z0DePJhd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so3407915e9.0
        for <timestamp@lists.linux.dev>; Wed, 24 Dec 2025 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766586766; x=1767191566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acBzvPA4QeFY0PeiSqzYItDFnTiAS+hVSKDt7fxlrqw=;
        b=Z0DePJhdhP5wJvyhuE6AbJXK2kKzW/UhAUt6ksQNCVuy020IENRmqmMGfzkNhdsvGu
         bkljAMXfx9UHnxMELNn/Ae5MQ0axQ2vDDGhV5RongdJ3dXbUJf+omU1uQcqCWo1657GJ
         rEc7zWptr3jqFnMB6peeOrn+yK8aT5c55uEy4WSraN655SWx+ToWNoscwvkRxC2qO2fZ
         ZRES6x+pnatcinTQvMuiYfcClHI/k9VYXrLl3YmYVdveRPKMnAnOJyva9ljx2kJ3aMPn
         zF2NlHhh0B44EiAHMErGwZjKhFodPnMBLQ6/0QLOsyA14XZ3cVlaBup9GUm2opeTOBBh
         5OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766586766; x=1767191566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acBzvPA4QeFY0PeiSqzYItDFnTiAS+hVSKDt7fxlrqw=;
        b=rYNxooGItbPMQCNUrQhdATzD14ivfhmGiKUiIBKF7cRKMRqY0zdWOW6tNM0upq63of
         zPdS8PPx6OhHuucdZYpgIcTQb+XtkfLU+BdStnV/LW2VfCR23UVwAFDp3ECEeAN58wNH
         CCRXS2cW7rUiTKlqsVSWr1u3gLDtiPAK50Nq0X3r9veX8R5oqLMXjh14/ZEa5HAuI1g0
         QxRT7yeR/CZc43o7jMgsf5hsaqIatlQmO6zrDLu3/wTog4n/FbG7ATh1KkTqUink768U
         fyM3F1g8jof9Kmf0aBRAomVDA6F+G0OBazCK0pqnd0tB9ZPLUvVpvOJLflrShyjquV/1
         +HuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyrHRaLbyJypjCJzb8PV0uTqfVFnyhnpnFxiqLrAt1hmYBSLIEjX9YchCDl14Brv6LMIz+PqGRLAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZzBrkpdxJMPJBgHPgHijgSC+mJgHtozHIeXZgsIj/eqY+uoBI
	p+VWn6ZsIPmQuY7ARST4ViJnWDfXa14fxo7fN+VIfqTQzK2XjWIGb+6vh73iI/be/4KMzGk6lgy
	R7BY0
X-Gm-Gg: AY/fxX73SDE3FT8C5Vnwbooc1481Ar6t6NVVMtYmEsMBBfgZ4gIncWWdNT60q16wblx
	EcRbfosC+6wQKL+xAm3cmzcXSEkf49ZcaFrDa4Gckx/KsQpYAYqEpSpsCs3tG+1mVPglr1QNN88
	4XBnPcuOOOssuwiFwaOkFxcdynI36e2FqWHD0t088aXRUaf0NIg6UPtgAaMJn7cb+jSpuGsdup6
	xksX5ayAXXElKSH5PzXDBniMMjL44nrTmBkx5CaPCUfzTl3DloqYgj/nhQhA2dDpHDstUU9IIs5
	yoJ7IbmUwfYKaci8oUluIyfZhpbQ56gjnN49RxgldgypHr2Zim+4nDAg5Xq8ZXThNA9SDXYwPHK
	LWq+o9UiLYJXEcPuaM+xur7hWXFBvNqJu20nkQcE6Vkh7YtCZI8DVaByeYMzbXUIK0eK+FdlVgn
	2hgiQ/DGH7J63bQMpxzlP2A8noFH0fMat/RZc=
X-Google-Smtp-Source: AGHT+IE4cnAiH/UTemP3VviqqIPEStBUFOA9zOzPLN0MZx5YnSEPlMp+v6tJla8erSUtJrhyJ0JqRA==
X-Received: by 2002:a05:600c:4711:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-47d195c1a71mr197366965e9.34.1766586765875;
        Wed, 24 Dec 2025 06:32:45 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d192e88f5sm291735845e9.0.2025.12.24.06.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:32:45 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Dipen Patel <dipenp@nvidia.com>
Subject: [PATCH v2] hte: replace use of system_unbound_wq with system_dfl_wq
Date: Wed, 24 Dec 2025 15:32:34 +0100
Message-ID: <20251224143234.47424-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen after a careful review and conversion of each individual
case, workqueue users must be converted to the better named new workqueues with
no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
Changes in v2:
- improved commit message
- rebased on v6.19-rc2
---
 drivers/hte/hte.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
index 23a6eeb8c506..e2804636f2bd 100644
--- a/drivers/hte/hte.c
+++ b/drivers/hte/hte.c
@@ -826,7 +826,7 @@ int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
 
 	ret = ei->cb(data, ei->cl_data);
 	if (ret == HTE_RUN_SECOND_CB && ei->tcb) {
-		queue_work(system_unbound_wq, &ei->cb_work);
+		queue_work(system_dfl_wq, &ei->cb_work);
 		set_bit(HTE_TS_QUEUE_WK, &ei->flags);
 	}
 
-- 
2.52.0

