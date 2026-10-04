Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0AF3E51D2
	for <timestamp@lists.linux.dev>; Sun,  4 Oct 2026 03:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085182; cv=none; b=e0isg/paMg1kK6MyPitVxWgcaeYim4eIr4Uo6dkKnT9vwG0LpUTBGNikr4GGi2GPD4OGA8S2sgC/g36BSwMR6Zd3ADbXHm9SRGVIPsCLZO391sgUR/Zzlbx3+PS+9wowRhcBFyMqlSShshb2gZ/qiN4Nrg1SNv+TobYXewu6zao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085182; c=relaxed/simple;
	bh=z95tIApCMgMzMQtaz0iwv8U5sDTYv5+wpk5hvmgAC+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghphUo3xWuQIu59dTsvZutT+dDiKRlJBGWvnEDaltONUfqACsR2YEds3CBnO6Z0DPYSi5QGYviCmm4W+qNB8sjMLdxz61oLIV31Nnob87JLM/EKbHJ0brEUcaDa69yLzlv5EPT+5NQloQqS9zZvX5Rat6jUbTMM14iT02hq/QyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rohw8FfX; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rohw8FfX"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9142e83204aso9896166d6.1
        for <timestamp@lists.linux.dev>; Sat, 03 Oct 2026 20:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791085180; x=1791689980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhk8BTSKwUwdy5UN+oAwyMBlhIqn2OVRwoj4KbDLpxI=;
        b=rohw8FfXywen9tMHrkIMYPGNWBYLQeWwANZ2EaJsv8BQz8zeZMO77mzUF/EdSYqmSp
         0NHMFF2KwazyuvcL4+jxhhcV6gSCxTWGHaPy1kPig1gKHhYeFn90kwp1dbvwS5HlkKPa
         fKXCUDwMTtUahgGCvLUyhsex/j3URK9dx2GTXAGqV1QOqpwZP/MOl1+NrmGW1qp2mWjf
         6AZFYG0DeSjpKjdiDHnC/NA8F4fFf7OGTuMJk8ezIAXPjnOJe13ScnejjgAGD90LNUsK
         8kQ/wGmxg7etq+e5xs4P7a2BlmsMiNtIU2oUcZxLjh8yZfimmQPUaGKqBLHKsjY9B4HB
         ZoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791085180; x=1791689980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhk8BTSKwUwdy5UN+oAwyMBlhIqn2OVRwoj4KbDLpxI=;
        b=A50O6o4vgZz8tinm7Paq/WyrwKhYXb3nph2vbPF1Eov1Bsv5vLkCaJSfF9HkVh63+Y
         VIAutvZsgcKeBLTXtTE0hJkS8LZZaccdXnSjCdMuO07l/SwnSl7OmkVK3x59fUN3p0NB
         iTSz/O+8x4pgqVpc20xjUilBpqv+M3y4VOy5w2PEoB9i1v+wvdV/3LA3F6aOHZNbsP3N
         5MtOLnvCCVHyCL7aLLLKHPwbAC/MMlXZLrF674W/XP/86aNwmV1ItNZJKL+VRlomoK2i
         cEzQ05L3AcXFmO75cUHJ99nSqeaQ7CRyaG6qRBsVnKtuK6yMxueUtHFLR9wnySqQerKL
         BqgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwejEG9Pr73L3iYFDseXtmO4QvmVgY7Bcb2ZUMR+6mO2HFuEKUyiNb2p9vJ+hsAZ0jtqMBjDLdzps8=@lists.linux.dev
X-Gm-Message-State: AFuF++nS5jH5b9brYd7fDBqcb7VcWDaKUdrY1zNXdn1EVjFdiojPp+qS
	TbDF7H15azz/Bewp4g95DD4tLVormGU/Nls5dJAOwi9izDaNJQ9TcHo=
X-Gm-Gg: AYBFou3T9TyIRfsJaM1+o6tIzNeJVgL+SjQLZ5RlW+WJOXSWfHOYnhBQBzlFKZayQMr
	9rXfmn67hFU1N6yZtervVQ9b5wR3iOudLU3fQZsu1b0YkoqBInm2erAfdTW/qbh7DEPqrjWOYHp
	PIGR6s1eCm+MgkxK8Mn+B/cX9F0PzDEr9XcxrBmddubUz60CT4jT9IyheRHiUNQpsdnrtmDk1sD
	zK/ewArVINH0KRt0uImefmzYjZlOAJ2A7TS9yIWWALhekC8VYdv5KXsjWF5+V61o5JslGiJ17QI
	LhRTumQ0p1o16bkP3wiJkhkhke/qU2Bh7uM7FVxsXXe0I3WBcAPWBjN/ppHuEme75dwF+lciuui
	OrlcfmsazNaQ2lRorA/LuQ7qAH1DbBB2ki/BOwhCyYWpkzsreAstAMEgsY43NpxzLi657TbMUx+
	LVfZyz+6oKks9PHRWiRS+gxdT98cPkuCOit11SqfUp1xFkX97KTL+KmH298AXN81FLpwDlmQzJQ
	OXRygK+tQSGXK7IJ7L8a/fwen3WwUu3x5q2YoJkNfBgpywnJhIOJZzSIpUYYZD05ze27CYYBQ9f
	gKezfwGk/4WDtVxnYJonHcOGOTLZ
X-Received: by 2002:a05:6214:85c5:10b0:917:a7a5:af08 with SMTP id 6a1803df08f44-917aa303f2amr145553496d6.25.1791085179220;
        Sat, 03 Oct 2026 20:39:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c11022sm57924096d6.41.2026.10.03.20.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:39:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Dipen Patel <dipenp@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] hte: tegra194: stop IRQ before releasing provider state
Date: Sat,  3 Oct 2026 23:39:35 -0400
Message-ID: <20261004033935.1114168-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devres unregisters the HTE chip before releasing the IRQ. Disabling
the controller does not wait for an already running FIFO handler,
which can still call hte_push_ts_ns() after chip->gdev has been freed.

Request the IRQ with IRQF_NO_AUTOEN after initializing its dependencies
and enable it after chip registration. Add managed actions to stop the
controller and disable and synchronize the IRQ before unregistering
the chip.

This builds on the linked slice-lock fix in the HTE maintainer tree.
The IRQ lifetime issue was found by static analysis.

Fixes: 09574cca6ad6 ("hte: Add Tegra194 HTE kernel provider")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260830161747.2719220-1-runyu.xiao@seu.edu.cn/
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Based on HTE for-next at 30167fadbf87. This IRQ-only patch requires
the slice-lock initialization fix:
  1329abe1bae4 ("hte: tegra194: Initialize slice locks before registering chip")
already applied to the HTE maintainer for-next tree. The same
prerequisite is required when backporting onto older trees. The
diff also preserves the earlier IRQ logging cleanup c21530a75b95;
older trees without that cleanup need its context applied/adapted.

 drivers/hte/hte-tegra194.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 189f7fcffbe2..9fb16b6be231 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -799,6 +799,13 @@ static void tegra_gte_disable(void *data)
 	tegra_hte_writel(gs, HTE_TECTRL, 0);
 }
 
+static void tegra_hte_disable_irq(void *data)
+{
+	struct tegra_hte_soc *gs = data;
+
+	disable_irq(gs->hte_irq);
+}
+
 static void tegra_hte_put_gpio_device(void *data)
 {
 	struct gpio_device *gdev = data;
@@ -854,10 +861,6 @@ static int tegra_hte_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 	hte_dev->hte_irq = ret;
-	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
-			       dev_name(dev), hte_dev);
-	if (ret < 0)
-		return ret;
 
 	gc->nlines = nlines;
 	gc->ops = &g_ops;
@@ -913,21 +916,33 @@ static int tegra_hte_probe(struct platform_device *pdev)
 		spin_lock_init(&hte_dev->sl[i].s_lock);
 	}
 
+	tegra_hte_writel(hte_dev, HTE_TECTRL, 0);
+
+	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr,
+			       IRQF_NO_AUTOEN, dev_name(dev), hte_dev);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_hte_register_chip(hte_dev->chip);
 	if (ret) {
 		dev_err(gc->dev, "hte chip register failed");
 		return ret;
 	}
 
+	enable_irq(hte_dev->hte_irq);
+	ret = devm_add_action_or_reset(dev, tegra_hte_disable_irq, hte_dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, tegra_gte_disable, pdev);
+	if (ret)
+		return ret;
+
 	val = HTE_TECTRL_ENABLE_ENABLE |
 	      (HTE_TECTRL_INTR_ENABLE << HTE_TECTRL_INTR_SHIFT) |
 	      (hte_dev->itr_thrshld << HTE_TECTRL_OCCU_SHIFT);
 	tegra_hte_writel(hte_dev, HTE_TECTRL, val);
 
-	ret = devm_add_action_or_reset(&pdev->dev, tegra_gte_disable, pdev);
-	if (ret)
-		return ret;
-
 	dev_dbg(gc->dev, "lines: %d, slices:%d", gc->nlines, slices);
 
 	return 0;
