Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF82356A4
	for <timestamp@lists.linux.dev>; Fri, 31 Oct 2025 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909790; cv=none; b=UrMNl2Za6xFWJ2kcqt0mPlsgmvPXJj0BIic+zrv1QUfSIZZXn4INV+fqcdNYP27Fba+0NygprDBiSjhVGOTpm3SPjj3ilooCVQkeEvjhCezoWtoJgBAXEOTGw01sRJBxMhqnYtVZKM16lpdZeCKcXDiGnX4kEtG0pNZzZj4wpiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909790; c=relaxed/simple;
	bh=BT8okCA8eZEgOFX0SczxxGmDYshaWqQ7hCqmcwWlNak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBXEHsyzxc2gwDjE+1Pkc0ukrQnu79ArknQlyDqXLTpApEDeoJwLRbdbgmPrGU61JQuO8dPh9ThaM+Y5kitwoxOMmhEETeMj/u+fN+Gih7fIM09/7paxQhR/4GMPWVEY48fvo5PoZmv4f3vgyF0jZ2WP1mH81dcA08kgHftw0gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d/wvp7ZU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d/wvp7ZU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710665e7deso10032285e9.1
        for <timestamp@lists.linux.dev>; Fri, 31 Oct 2025 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761909785; x=1762514585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0xMu5Ua6JY9tynLrWU4a3rWJNSe8oVSDMvD70HfAAI=;
        b=d/wvp7ZU19QU/yyfWJSwjw05rDSDcsMQSE6s6oaf0Ja/M4Uq2Nh0gYDSQfoRdQkwq9
         gCgMC1yvjxDYCsbKYyXFSIkO610Kass2whY1aZ21ZdJ1rDReHeSwWLkCMvqACcz8fINH
         e2TLwVNxneoxWVwpi323/es8jocL+qU+x1+p7wlU+EQseMoP6HUFLG3DzgvF3GEgQwiS
         9dr9iKIrM94yImxdz6mjiQavmaCwohmUAVqdOvyyrwFSOiJ3guSwcQmtrtse2P9mLPWp
         4t6oqTOITygh7YswiowVSIMyClAwh47PUNcpgvYsEBPUwSNH4s+OK+HfWE5OMGcT3B7b
         xhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909785; x=1762514585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0xMu5Ua6JY9tynLrWU4a3rWJNSe8oVSDMvD70HfAAI=;
        b=sv31cJRtOVqf3tfdJl0PHvN5GEBaqaZ8C2z7eSGy1VMIWGhxO/Wo93GGspq/a1YO5O
         5WMrwo0yoEF8bL17ueOXiy3dvFE5nVAuyJxu6nFJvUjPUoKVv/8hfUKyNaIkTXc+899w
         RMCWB0c2im2u3q70BKFwUgRXGyBbrI0VKxwC+UDLSFRekBj8cpji+qDCjrgVADNLnBqs
         7+wqYHQLbQYzZpjNPu0DnB9Wsgb++TGmw1SyQ7WPvaCoRNbmcGfZb6KD0W9TKMkzhbVR
         NfZZU6zgi0+GhiBU5DVH/Y4IeyKrr5j0oPk2fZ3p4Vp0ZUAA3uuaLxEQRoW5isPe5pZI
         0q0w==
X-Forwarded-Encrypted: i=1; AJvYcCWBCLtcqTzcqjmtGkD0nz8wRDYav8/C7wIWEV2zoEMX581fy9+BPafE0f7AlCdiggQdWGiSB75J/Fk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjLQgl11GFyYiDx48cMbxGEu76KrUOG8B/tGG5Ra5XARApuL/O
	sbsxP5VGwq1DFK5C1GBYZCXo5Rg5tI27emzak1lE47kf/MAvkeCef4PNzBlyU4kRuIQ=
X-Gm-Gg: ASbGnctrZbpb7OtviMcG2FJzgorg86le1Uqr/ApSBomHwRe5F9JqokH0Hwihx/tE35C
	EDOAw7W2NptUMlYQabNGLBpbuZbqspASk99lkvaQCHNb+CBSXs6dd3vdsmc0GRiaGvNachY4yz8
	OnrU6vWyh2Sft0I4YzyzB0/rPFYu0Zzcf2TEjQd9Y07/s6QWGBIk9KV9xnhhueTQUqWrnzq30mH
	e9rLIKniDcbLl4lxOlQ4O/upId6WO7B3ryZ4TrHazbZID2rpffk74rZECzgQNGDnsnqciMsp76F
	sJA6m8N26zFAQcggBa7hi4/MpDzgFdCn5gAKjwd9nkRhtT+qqN1tV54PpWky1qufJTh12Ixg6fY
	uY6A0NMMV8bQPR9Pq+Uxbwb9IY61sHmqtayyg2N+KWC+vTForMtgm+5yf99C9BjboaA6F9J9Dot
	om9DmEjvMdjyDwRyjmmPuJc9uj
X-Google-Smtp-Source: AGHT+IH8IpAvQq5pUwzK1vwfIRUxicibFTP05YUKImMjbAHpOVXsVVERZU8YxomZ/j6mb0BGr3IQPg==
X-Received: by 2002:a05:600c:524f:b0:475:dc98:4489 with SMTP id 5b1f17b1804b1-477308be79dmr27679575e9.33.1761909784890;
        Fri, 31 Oct 2025 04:23:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728ab375asm89060275e9.17.2025.10.31.04.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:23:04 -0700 (PDT)
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
Subject: [PATCH] hte: replace use of system_unbound_wq with system_dfl_wq
Date: Fri, 31 Oct 2025 12:22:56 +0100
Message-ID: <20251031112256.149436-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
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
2.51.0

