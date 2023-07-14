Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A914A83
	for <timestamp@lists.linux.dev>; Fri, 14 Jul 2023 17:46:20 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-346541baf2aso7993975ab.1
        for <timestamp@lists.linux.dev>; Fri, 14 Jul 2023 10:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356779; x=1691948779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD0GCzyHwk+fw3TWcRW0UAKm/GOePKzWL5Rq+E6gtqA=;
        b=JogZvRznwfrwZG1SVALJloti0ix6vqcPZqCIxeRT+3DXTXk2eXWuomTKW5IfHkk11G
         TnUHOydewbCsk/YWJMQr0WwrUY8B5s4nv9UOn+piLrB7M+hGSXe1/dT4+wHs9GbxpD8p
         U8fvmgjk2aG0d5FwrDAtH0Qex3YNpe4gtLpB55o62pUFFFdGelFdGIWXOf4loXzJmqib
         BU0JqZszJwiJ+6SxzBgLZ7SL8mnyiC5NFkDjRWt4I93Px7rhrmPY7qGYYd4pF5HHgjES
         CSq+VXK9ba6tXw3tPHchoNTXUmK4TMyYnjIu8P1xjknY7NfFYwucCc6QYs0aAzGPtgjR
         3r6A==
X-Gm-Message-State: ABy/qLbJ1wi8gj/+NnyXpanRCWyoi14cY+xXmkEgUwFMJA12Cy0de4df
	q2RqdIlvSxzRVhFkO7a6iKMNRmH+Dw==
X-Google-Smtp-Source: APBJJlGBxsepro6zr7BfN9FfixRTKcjjtT51R7lFNo9G+WBwzHvg0MWW6tHrd3VzejdbK6RBfp0xFw==
X-Received: by 2002:a05:6e02:e0e:b0:33e:51bf:727d with SMTP id a14-20020a056e020e0e00b0033e51bf727dmr2417113ilk.10.1689356779202;
        Fri, 14 Jul 2023 10:46:19 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id j3-20020a02cc63000000b0042bb2448847sm2620708jaq.53.2023.07.14.10.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:46:18 -0700 (PDT)
Received: (nullmailer pid 4057142 invoked by uid 1000);
	Fri, 14 Jul 2023 17:46:04 -0000
From: Rob Herring <robh@kernel.org>
To: Dipen Patel <dipenp@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, timestamp@lists.linux.dev, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hte: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:46:00 -0600
Message-Id: <20230714174600.4057041-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/hte/hte-tegra194.c | 1 -
 drivers/hte/hte.c          | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 06ef349a2265..6fe6897047ac 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -12,7 +12,6 @@
 #include <linux/stat.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/hte.h>
 #include <linux/uaccess.h>
diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
index 67c15724ee78..598a716b7364 100644
--- a/drivers/hte/hte.c
+++ b/drivers/hte/hte.c
@@ -10,12 +10,12 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mutex.h>
 #include <linux/uaccess.h>
 #include <linux/hte.h>
 #include <linux/delay.h>
 #include <linux/debugfs.h>
+#include <linux/device.h>
 
 #define HTE_TS_NAME_LEN		10
 
-- 
2.40.1

